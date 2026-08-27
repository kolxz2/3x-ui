# Rebase onto upstream/main.
# Keep README.ru_RU.md as it is on the current branch.
# Merge .gitignore (upstream + local extra lines).
# On every other conflict, take upstream (remote).
#
# Usage:  powershell -File tools/rebase-upstream.ps1

$ErrorActionPreference = "Stop"
Set-StrictMode -Version Latest
if ($PSVersionTable.PSVersion.Major -ge 7) {
    $PSNativeCommandUseErrorActionPreference = $false
}

$repoRoot = (git rev-parse --show-toplevel).Trim()
Set-Location $repoRoot

$keepReadme = Join-Path $repoRoot "README.ru_RU.md"
$keepGitignore = Join-Path $repoRoot ".gitignore"
if (-not (Test-Path $keepReadme)) { throw "README.ru_RU.md not found" }
if (-not (Test-Path $keepGitignore)) { throw ".gitignore not found" }

$work = Join-Path $env:TEMP ("xui-rebase-" + [guid]::NewGuid().ToString("n"))
New-Item -ItemType Directory -Path $work | Out-Null
$readmeSnap = Join-Path $work "README.ru_RU.md"
$gitignoreSnap = Join-Path $work "gitignore"
Copy-Item $keepReadme $readmeSnap -Force
Copy-Item $keepGitignore $gitignoreSnap -Force

$gitUsrBin = "C:\Program Files\Git\usr\bin"
if (Test-Path (Join-Path $gitUsrBin "true.exe")) {
    $env:PATH = $gitUsrBin + ";" + $env:PATH
}
$env:GIT_EDITOR = "true"
$env:EDITOR = "true"
$env:VISUAL = "true"
$env:GIT_SEQUENCE_EDITOR = "true"
$env:GIT_MERGE_AUTOEDIT = "no"

function Test-RebaseInProgress {
    return (Test-Path (Join-Path $repoRoot ".git/rebase-merge")) -or
        (Test-Path (Join-Path $repoRoot ".git/rebase-apply"))
}

function Get-Lines($output) {
    if ($null -eq $output) { return @() }
    if ($output -is [string]) {
        $s = $output.Trim()
        if ($s -eq "") { return @() }
        return @($s)
    }
    return @($output | Where-Object { $_ -and $_.Trim() -ne "" })
}

function Get-UnmergedPaths {
    return @(Get-Lines (git -c core.quotepath=false diff --name-only --diff-filter=U))
}

function Get-IndexStages([string]$path) {
    $stages = New-Object "System.Collections.Generic.HashSet[int]"
    git ls-files -u -- $path | ForEach-Object {
        if ($_ -match "^\S+\s+\S+\s+(\d+)\t") {
            [void]$stages.Add([int]$Matches[1])
        }
    }
    return $stages
}

function Get-GitShow([string]$spec) {
    $text = & git show $spec 2>$null
    if ($LASTEXITCODE -ne 0 -or $null -eq $text) { return $null }
    if ($text -is [array]) { return ($text -join "`n") }
    return [string]$text
}

function Write-Utf8File([string]$path, [string]$text) {
    if (-not $text.EndsWith("`n")) { $text += "`n" }
    $utf8 = New-Object System.Text.UTF8Encoding $false
    [System.IO.File]::WriteAllText($path, $text.Replace("`r`n", "`n").Replace("`r", "`n"), $utf8)
}

function Merge-GitignoreText([string]$upstream, [string]$local) {
    if ([string]::IsNullOrEmpty($upstream)) { return $local }
    if ([string]::IsNullOrEmpty($local)) { return $upstream }

    $have = New-Object "System.Collections.Generic.HashSet[string]" ([StringComparer]::Ordinal)
    foreach ($line in ($upstream -split "`n", [StringSplitOptions]::None)) {
        [void]$have.Add($line.TrimEnd("`r"))
    }

    $extra = New-Object System.Collections.Generic.List[string]
    foreach ($line in ($local -split "`n", [StringSplitOptions]::None)) {
        $line = $line.TrimEnd("`r")
        if ($have.Contains($line)) { continue }
        if ($line -eq "" -and $extra.Count -eq 0) { continue }
        $extra.Add($line)
        [void]$have.Add($line)
    }

    $result = $upstream.TrimEnd("`r", "`n")
    if ($extra.Count -gt 0) {
        $result = $result + "`n" + ($extra -join "`n")
    }
    return $result
}

function Resolve-GitignoreConflict {
    $ours = Get-GitShow ":2:.gitignore"
    $theirs = Get-GitShow ":3:.gitignore"
    if ([string]::IsNullOrEmpty($ours)) { $ours = Get-Content -Raw $gitignoreSnap }
    if ([string]::IsNullOrEmpty($theirs)) { $theirs = Get-Content -Raw $gitignoreSnap }
    $merged = Merge-GitignoreText $ours $theirs
    $merged = Merge-GitignoreText $merged (Get-Content -Raw $gitignoreSnap)
    Write-Utf8File (Join-Path $repoRoot ".gitignore") $merged
    git add -- .gitignore
}

function Resolve-Conflicts {
    $paths = @(Get-UnmergedPaths)
    foreach ($path in $paths) {
        $norm = $path.Replace("\", "/")
        if ($norm -eq "README.ru_RU.md") {
            git checkout --theirs -- $path 2>$null
            if ($LASTEXITCODE -ne 0) {
                Copy-Item $readmeSnap (Join-Path $repoRoot "README.ru_RU.md") -Force
            }
            git add -- $path
            continue
        }
        if ($norm -eq ".gitignore") {
            Resolve-GitignoreConflict
            continue
        }

        $stages = Get-IndexStages $path
        if (-not $stages.Contains(2)) {
            git rm -f -- $path 2>$null
            if ($LASTEXITCODE -ne 0) {
                if (Test-Path $path) { Remove-Item -Force -Recurse $path }
                git add -u -- $path
            }
            continue
        }

        git checkout --ours -- $path
        git add -- $path
    }
}

function Continue-Rebase {
    $unmerged = @(Get-UnmergedPaths)
    if ($unmerged.Count -gt 0) {
        throw "Still unmerged: $($unmerged -join ', ')"
    }

    $staged = @(Get-Lines (git diff --cached --name-only))
    if ($staged.Count -eq 0) {
        Write-Host "Empty patch after resolve, skipping."
        git rebase --skip
        return
    }

    git -c core.editor=true rebase --continue
}

Write-Host "Fetching upstream..."
git fetch upstream

if (Test-RebaseInProgress) {
    throw "A rebase is already in progress. Run git rebase --abort first, or finish it."
}

Write-Host "Starting rebase onto upstream/main..."
git rebase upstream/main
$rebaseExit = $LASTEXITCODE

$i = 0
while ((Test-RebaseInProgress) -and $i -lt 100) {
    $i++
    $unmerged = @(Get-UnmergedPaths)
    if ($unmerged.Count -gt 0) {
        Write-Host ("Conflict #$i : " + ($unmerged -join ", "))
        Resolve-Conflicts
    }

    Continue-Rebase
    $rebaseExit = $LASTEXITCODE
    if (($rebaseExit -ne 0) -and (Test-RebaseInProgress) -and (@(Get-UnmergedPaths).Count -eq 0)) {
        throw "git rebase --continue/--skip failed (exit $rebaseExit) with no remaining conflicts."
    }
}

if (Test-RebaseInProgress) {
    throw "Rebase still in progress after $i steps. Inspect git status."
}

if ($rebaseExit -ne 0 -and -not (Test-RebaseInProgress)) {
    $status = git status -sb
    if ($status -match "Unmerged|both modified|deleted by") {
        throw "Rebase failed. git status: $status"
    }
}

Write-Host "Restoring README.ru_RU.md and merging .gitignore extras..."
Copy-Item $readmeSnap (Join-Path $repoRoot "README.ru_RU.md") -Force

$currentIgnore = Get-Content -Raw (Join-Path $repoRoot ".gitignore")
$savedIgnore = Get-Content -Raw $gitignoreSnap
$finalIgnore = Merge-GitignoreText $currentIgnore $savedIgnore
Write-Utf8File (Join-Path $repoRoot ".gitignore") $finalIgnore

Remove-Item -Recurse -Force $work

Write-Host ""
Write-Host "Rebase finished."
git status -sb
Write-Host ""
Write-Host "README.ru_RU.md and .gitignore extras were restored in the working tree."
Write-Host "If git status shows them modified, commit when you are ready:"
Write-Host '  git add README.ru_RU.md .gitignore'
Write-Host '  git commit -m "chore: keep fork README.ru_RU.md and gitignore extras"'
