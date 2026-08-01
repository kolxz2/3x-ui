[English](/README.md) | [فارسی](/README.fa_IR.md) | [العربية](/README.ar_EG.md) | [中文](/README.zh_CN.md) | [Español](/README.es_ES.md) | [Русский](/README.ru_RU.md) | [Türkçe](/README.tr_TR.md)

<p align="center">
  <picture>
    <source media="(prefers-color-scheme: dark)" srcset="./media/3x-ui-dark.png">
    <img alt="3x-ui" src="./media/3x-ui-light.png">
  </picture>
</p>

<p align="center">
  <a href="https://github.com/kolxz2/3x-ui/releases"><img src="https://img.shields.io/github/v/release/kolxz2/3x-ui" alt="Release"></a>
  <a href="https://github.com/kolxz2/3x-ui/actions"><img src="https://img.shields.io/github/actions/workflow/status/kolxz2/3x-ui/release.yml.svg" alt="Build"></a>
  <a href="#"><img src="https://img.shields.io/github/go-mod/go-version/kolxz2/3x-ui.svg" alt="GO Version"></a>
  <a href="https://github.com/kolxz2/3x-ui/releases/latest"><img src="https://img.shields.io/github/downloads/kolxz2/3x-ui/total.svg" alt="Downloads"></a>
  <a href="https://www.gnu.org/licenses/gpl-3.0.en.html"><img src="https://img.shields.io/badge/license-GPL%20V3-blue.svg?longCache=true" alt="License"></a>
  <a href="https://pkg.go.dev/github.com/kolxz2/3x-ui/v3"><img src="https://pkg.go.dev/badge/github.com/kolxz2/3x-ui/v3.svg" alt="Go Reference"></a>
  <a href="https://goreportcard.com/report/github.com/kolxz2/3x-ui/v3"><img src="https://goreportcard.com/badge/github.com/kolxz2/3x-ui/v3" alt="Go Report Card"></a>
</p>

**3X-UI** is an advanced, open-source web control panel for managing [Xray-core](https://github.com/XTLS/Xray-core) servers. It provides a clean, multi-language interface for deploying, configuring, and monitoring a wide range of proxy and VPN protocols — from a single VPS to multi-node deployments.

Built as an enhanced fork of the original X-UI project, 3X-UI adds broader protocol support, improved stability, per-client traffic accounting, and many quality-of-life features.

> [!IMPORTANT]
> This project is intended for personal use only. Please do not use it for illegal purposes or in a production environment.

## Features

- **Multi-protocol inbounds** — VLESS, VMess, Trojan, Shadowsocks, WireGuard, Hysteria2, HTTP, SOCKS (Mixed), Dokodemo-door / Tunnel, and TUN.
- **Modern transports & security** — TCP (Raw), mKCP, WebSocket, gRPC, HTTPUpgrade, and XHTTP, secured with TLS, XTLS, and REALITY.
- **Fallbacks** — serve multiple protocols on a single port (e.g. VLESS and Trojan on 443) using Xray's fallback support.
- **Per-client management** — traffic quotas, expiry dates, IP limits, live online status, and one-click share links, QR codes, and subscriptions.
- **Traffic statistics** — per inbound, per client, and per outbound, with reset controls.
- **Multi-node support** — manage and scale across multiple servers from a single panel.
- **Outbound & routing** — WARP, NordVPN, custom routing rules, load balancers, and outbound proxy chaining.
- **Built-in subscription server** with multiple output formats and [custom page templates](docs/custom-subscription-templates.md).
- **Telegram bot** for remote monitoring and management.
- **RESTful API** with in-panel Swagger documentation.
- **Flexible storage** — SQLite (default) or PostgreSQL.
- **13 UI languages** with dark and light themes.
- **Fail2ban integration** for enforcing per-client IP limits.

## Screenshots

<details>
<summary>Click to expand</summary>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="./media/01-overview-dark.png">
  <img alt="Overview" src="./media/01-overview-light.png">
</picture>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="./media/02-add-inbound-dark.png">
  <img alt="Inbounds" src="./media/02-add-inbound-light.png">
</picture>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="./media/03-add-client-dark.png">
  <img alt="Add client" src="./media/03-add-client-light.png">
</picture>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="./media/05-add-nodes-dark.png">
  <img alt="Configs" src="./media/05-add-nodes-light.png">
</picture>

</details>

## Quick Start

```bash
bash <(curl -Ls https://raw.githubusercontent.com/kolxz2/3x-ui/master/install.sh)
```

To install a specific version, append its tag (e.g. `v3.4.0`):

```bash
bash <(curl -Ls https://raw.githubusercontent.com/mhsanaei/3x-ui/master/install.sh) v3.4.0
```

To install the rolling **dev** build (latest per-commit pre-release from `main`, not a stable release), pass `dev-latest`:

```bash
bash <(curl -Ls https://raw.githubusercontent.com/mhsanaei/3x-ui/master/install.sh) dev-latest
```

During installation a random username, password, and access path are generated. After installation, run `x-ui` to open the management menu, where you can start/stop the service, view or reset your login credentials, manage SSL certificates, and more.

For full documentation, please visit the [project Wiki](https://github.com/kolxz2/3x-ui/wiki).

### Unattended install

The installer also runs **non-interactively** for cloud-init.
Set `XUI_NONINTERACTIVE=1` (or pipe with no TTY) and it installs end-to-end with
zero prompts, generating random credentials and writing them to
`/etc/x-ui/install-result.env`. See [`deploy/`](deploy/) for:

- [Cloud-init user-data](deploy/cloud-init/) — unattended install on any cloud (Hetzner/AWS/DO/Vultr/GCP/Azure/Oracle)
- [Hetzner Cloud notes](deploy/marketplace/hetzner/) — cloud-init deployment on Hetzner

## Supported Platforms

**Operating systems:** Ubuntu, Debian, Armbian, Fedora, CentOS, RHEL, AlmaLinux, Rocky Linux, Oracle Linux, Amazon Linux, Virtuozzo, Arch, Manjaro, Parch, openSUSE (Tumbleweed / Leap), Alpine, and Windows.

**Architectures:** `amd64` · `386` · `arm64` (aarch64) · `armv7` · `armv6` · `armv5` · `s390x`.

## Database Options

3X-UI supports two backends, chosen during the install:

- **SQLite** (default) — a single file at `/etc/x-ui/x-ui.db`. Zero setup, ideal for small and medium deployments.
- **PostgreSQL** — recommended for high client counts or multi-node setups. The installer can install PostgreSQL locally for you, or accept a DSN to an existing server.

At runtime the backend is selected via environment variables (the installer writes these to `/etc/default/x-ui` for you):

```
XUI_DB_TYPE=postgres
XUI_DB_DSN=postgres://xui:password@127.0.0.1:5432/xui?sslmode=disable
```

### Migrating an existing SQLite install to PostgreSQL

```bash
x-ui migrate-db --dsn "postgres://xui:password@127.0.0.1:5432/xui?sslmode=disable"
# then set XUI_DB_TYPE and XUI_DB_DSN in /etc/default/x-ui and restart:
systemctl restart x-ui
```

The source SQLite file is left untouched; remove it manually once you have verified the new backend.

### Editing subscription JSON routing rules (`subJsonRules`) via SQLite

These steps apply only when the panel uses the default **SQLite** backend (`/etc/x-ui/x-ui.db`). Stop or avoid concurrent panel writes while editing the database.

#### 1. Install `sqlite3` on the server

**Ubuntu / Debian:**

```bash
apt update
apt install sqlite3 -y
```

Verify:

```bash
sqlite3 --version
```

#### 2. Open the 3X-UI database

Database file: `/etc/x-ui/x-ui.db`

```bash
sqlite3 /etc/x-ui/x-ui.db
```

#### 3. Verify the database

Inside the `sqlite3` shell:

```sql
.tables
```

You should see tables such as `settings`, `inbounds`, and others.

#### 4. Back up the current subscription rules

```sql
SELECT value FROM settings WHERE key='subJsonRules';
```

Copy the result before making changes — this is your backup.

#### 5. Update routing rules (add domains)

Replace the value below with your own JSON if needed. The example is synced from [`amnezia_sites.json`](amnezia_sites.json) (Amnezia split-tunnel list): each hostname becomes a `domain:` rule; unique resolved IPs from that file are included as a fallback. Base rules: `2ip.ru` / `mp-raketa.ru` → proxy; `geoip:private` + `geoip:ru` and `geosite:category-ru` → direct; everything else → proxy.

To regenerate the JSON after editing `amnezia_sites.json`: `node scripts/gen-sub-json-rules.mjs`

```sql
UPDATE settings
SET value='[{"type":"field","domain":["domain:2ip.ru","domain:mp-raketa.ru"],"network":"tcp,udp","outboundTag":"proxy"},{"type":"field","ip":["geoip:private","geoip:ru"],"outboundTag":"direct"},{"type":"field","domain":["geosite:category-ru","domain:xn--p1ai","domain:by","keyword:kinozal","keyword:nnmclub","domain:a.wb.ru","domain:am.wildberries.ru","domain:api.plus.kinopoisk.ru","domain:app.e-comet.io","domain:avatars.mds.yandex.net","domain:basket-38.wbbasket.ru","domain:by.wildberries.ru","domain:career.hh.ru","domain:cdn-assets.setka.ru","domain:cdn.setka.ru","domain:cdn.uxfeedback.ru","domain:cdn.wbbasket.ru","domain:cdn1.ozonusercontent.com","domain:cdn2.ozone.ru","domain:chat-prod.wildberries.ru","domain:chat.e-comet.io","domain:chat.wildberries.ru","domain:cmp-new.wildberries.ru","domain:cmp.wildberries.ru","domain:data-checker.wildberries.ru","domain:delivery-bt.wildberries.ru","domain:disk.hh.ru","domain:e-comet.io","domain:ext-strm-rukzn04mts-01.strm.yandex.net","domain:graphql.kinopoisk.ru","domain:hd.kinopoisk.ru","domain:hh.ru","domain:hhcdn.ru","domain:highlight.wildberries.ru","domain:i.hh.ru","domain:identical-products.wildberries.ru","domain:installments-aggregator-bt.wildberries.ru","domain:ir-11.ozone.ru","domain:ir.ozone.ru","domain:journal-bt.wildberries.ru","domain:kg.wildberries.ru","domain:kz.wildberries.ru","domain:log.strm.yandex.ru","domain:marketplace-sentry.wb.ru","domain:mc.yandex.com","domain:mc.yandex.ru","domain:ozon.by","domain:ozon.ru","domain:points.wb.ru","domain:questions.wildberries.ru","domain:seller-auth.wildberries.ru","domain:seller.ozon.ru","domain:seller.wildberries.ru","domain:setka.ru","domain:st.ozone.ru","domain:static-basket-01.wbbasket.ru","domain:static-mon.yandex.net","domain:strm.yandex.ru","domain:suppliers-shipment-2.wildberries.ru","domain:tracking.ott.yandex.net","domain:user-features.wb.ru","domain:userstorage-02adm.wb.ru","domain:v-1.ozone.ru","domain:wbx-bell-v3.wildberries.ru","domain:wbxoofex.wildberries.ru","domain:wildberries.by","domain:wildberries.ru","domain:www.ozon.ru","domain:www.wildberries.by","domain:www.wildberries.ru","domain:xapi.ozon.ru","domain:yandex.ru","domain:yastatic.net"],"outboundTag":"direct"},{"type":"field","network":"tcp,udp","outboundTag":"proxy"}]'
WHERE key='subJsonRules';
```

You can also edit these rules in the panel under **Settings → Subscription formats** when the JSON subscription format is enabled.

#### 6. Exit `sqlite3`

```text
.exit
```

#### 7. Restart 3X-UI

```bash
systemctl restart x-ui
```

### Docker

The default `docker compose up -d` keeps using SQLite. To run with the bundled PostgreSQL service, uncomment the two `XUI_DB_*` env lines in `docker-compose.yml` and start with the profile:

```bash
docker compose --profile postgres up -d
```

The image bundles Fail2ban (enabled by default) to enforce per-client **IP limits**. Fail2ban bans offenders with `iptables`, which requires the `NET_ADMIN` capability. `docker-compose.yml` already grants it via `cap_add`; if you start the container with `docker run` instead, add the capabilities yourself, otherwise bans are logged but never applied:

```bash
docker run -d --cap-add=NET_ADMIN --cap-add=NET_RAW ... ghcr.io/kolxz2/3x-ui
```

## Environment Variables

| Variable | Description | Default |
| --- | --- | --- |
| `XUI_DB_TYPE` | Database backend: `sqlite` or `postgres` | `sqlite` |
| `XUI_DB_DSN` | PostgreSQL connection string (when `XUI_DB_TYPE=postgres`) | — |
| `XUI_DB_FOLDER` | Directory for the SQLite database file | `/etc/x-ui` |
| `XUI_DB_MAX_OPEN_CONNS` | Maximum open connections (PostgreSQL pool) | — |
| `XUI_DB_MAX_IDLE_CONNS` | Maximum idle connections (PostgreSQL pool) | — |
| `XUI_INIT_WEB_BASE_PATH` | The initial URI path for the web panel | `/` |
| `XUI_ENABLE_FAIL2BAN` | Enable Fail2ban-based IP-limit enforcement | `true` |
| `XUI_LOG_LEVEL` | Log verbosity (`debug`, `info`, `warning`, `error`) | `info` |
| `XUI_DEBUG` | Enable debug mode | `false` |
| `XUI_TUNNEL_HEALTH_MONITOR` | Enable the tunnel health monitor (probes a URL and restarts xray after repeated failures; a restart drops all clients) | `false` |
| `XUI_TUNNEL_HEALTH_PROXY` | Proxy the probe is sent through; point it at a local xray inbound so the probe tests the tunnel (e.g. `socks5://127.0.0.1:1080`). Empty means the probe only checks host connectivity | — |
| `XUI_TUNNEL_HEALTH_URL` | URL probed for tunnel health | `https://www.cloudflare.com/cdn-cgi/trace` |
| `XUI_TUNNEL_HEALTH_INTERVAL` | Interval between probes | `30s` |
| `XUI_TUNNEL_HEALTH_TIMEOUT` | Per-probe timeout | `10s` |
| `XUI_TUNNEL_HEALTH_FAILURES` | Consecutive failures before a restart is triggered | `3` |
| `XUI_TUNNEL_HEALTH_COOLDOWN` | Minimum delay between consecutive restarts | `5m` |

## Supported Languages

The panel UI is available in 13 languages:

English · فارسی · العربية · 中文（简体） · 中文（繁體） · Español · Русский · Українська · Türkçe · Tiếng Việt · 日本語 · Bahasa Indonesia · Português (Brasil)

## Fork maintenance & releases

This repository is a fork of [MHSanaei/3x-ui](https://github.com/MHSanaei/3x-ui). The notes below apply to maintaining **your fork** (`kolxz2/3x-ui`) and publishing binaries via GitHub Actions ([`release.yml`](/.github/workflows/release.yml)).

### Sync your fork with upstream

Check remotes:

```bash
git remote -v
```

If `upstream` is not listed yet, add the original repository:

```bash
git remote add upstream https://github.com/MHSanaei/3x-ui.git
```

Verify:

```bash
git remote -v
```

You should see something like:

```text
origin    https://github.com/kolxz2/3x-ui.git (fetch)
origin    https://github.com/kolxz2/3x-ui.git (push)
upstream  https://github.com/MHSanaei/3x-ui.git (fetch)
upstream  https://github.com/MHSanaei/3x-ui.git (push)
```

Fetch the latest changes from upstream:

```bash
git fetch upstream
```

List remote branches:

```bash
git branch -r
```

**Option 1 — merge (recommended).** On your machine, in your `main` branch:

```bash
git checkout main
git fetch upstream
git merge upstream/main
git push origin main
```

**Option 2 — rebase (linear history).** Use only if you are comfortable with rebasing:

```bash
git checkout main
git fetch upstream
git rebase upstream/main
git push origin main
```

If you already pushed your old `main` to GitHub, a rebase may require `git push --force-with-lease origin main` — use that only when you intend to rewrite remote history.

#### Resolving merge conflicts

After a long gap between syncs, Git may report many conflicts — especially **modify/delete** on old paths (`web/`, `database/`, `xray/`, `sub/`, `config/version`) that upstream moved into `internal/`. That is expected.

**Accept all upstream changes** (take upstream code, drop stale fork paths):

```bash
git checkout --theirs .
git add -A
git commit -m "Merge upstream/main"
git push origin main
```

During a merge, **`theirs` = `upstream/main`**, **`ours` = your fork**. If `git checkout --theirs` reports *“does not have their version”* for deleted legacy files, remove them explicitly:

```bash
git rm config/version database/db.go web/web.go xray/process.go
git add -A
git commit -m "Merge upstream/main"
```

**Keep fork-only edits** (README badges/links, `amnezia_sites.json`, install URLs pointing to `kolxz2/3x-ui`) in a separate commit *after* the merge commit, so the next upstream sync stays simple.

#### After each upstream sync

1. Check status: `git status` (must be clean before you push).
2. Compare with upstream: `git log --oneline main..upstream/main` — empty output means you are up to date.
3. Re-apply any fork-only changes you still need (README, subscription rules, etc.).
4. Build locally if you develop on the panel:

   ```bash
   cd frontend && npm ci && npm run build && cd ..
   go run .
   ```

   See [`CONTRIBUTING.md`](/CONTRIBUTING.md) and `make help` for the full dev workflow (`make verify`, `make gen`, …).

### Fork-only customizations in this repo

| What | Where |
| --- | --- |
| Install / Docker image URLs | `README*.md`, `install.sh` — point to `kolxz2/3x-ui` |
| Subscription routing (Amnezia split-tunnel) | [`amnezia_sites.json`](amnezia_sites.json) → regenerate with `node scripts/gen-sub-json-rules.mjs` |
| Release binaries | GitHub Actions [`.github/workflows/release.yml`](/.github/workflows/release.yml) on your fork |

Upstream code lives under `internal/` (not the old top-level `web/`, `database/`, `xray/`). Version file: [`internal/config/version`](internal/config/version).

### Publish a GitHub Release (binaries)

You **do not** need to create a release manually in the GitHub UI. The **Release 3X-UI** workflow builds Linux/Windows archives and attaches them to a release when you push a **version tag**.

1. Set the version in [`internal/config/version`](internal/config/version) (must match the tag, without the `v` prefix) and commit.
2. Push to your fork:

   ```bash
   git push origin main
   ```

3. Create and push a tag with a **`v` prefix** (required by the workflow), for example `v3.6.0`:

   ```bash
   git tag v3.6.0
   git push origin v3.6.0
   ```

   Tags like `3.6.0` **without** `v` will **not** trigger upload to [Releases](https://github.com/kolxz2/3x-ui/releases).

4. Wait for the workflow on the [Actions](https://github.com/kolxz2/3x-ui/actions) tab (~10–15 minutes). When it finishes, open **Releases** — assets such as `x-ui-linux-amd64.tar.gz` and `x-ui-windows-amd64.zip` should appear under that tag.

The workflow also runs on pushes to `main` when files under `.go`, `go.mod`, `frontend/`, `*.sh`, etc. change; in that case artifacts are stored under **Actions → Artifacts** only. **Release assets on the Releases page are uploaded only for tag pushes** (`refs/tags/v…`).

To build without pushing a tag: **Actions → Release 3X-UI → Run workflow** (`workflow_dispatch`).

## Contributing

Contributions are welcome. Please read the [Contributing Guide](/CONTRIBUTING.md) before opening an issue or pull request.

## A Special Thanks to

- [alireza0](https://github.com/alireza0/)

## Acknowledgment

- [Iran v2ray rules](https://github.com/chocolate4u/Iran-v2ray-rules) (License: **GPL-3.0**): _Enhanced v2ray/xray and v2ray/xray-clients routing rules with built-in Iranian domains and a focus on security and adblocking._
- [Russia v2ray rules](https://github.com/runetfreedom/russia-v2ray-rules-dat) (License: **GPL-3.0**): _This repository contains automatically updated V2Ray routing rules based on data on blocked domains and addresses in Russia._

## Community Tools

Tools and integrations built by the community around 3x-ui.

- [terraform-provider-3x-ui](https://github.com/batonogov/terraform-provider-threexui) (License: **MIT**): _Manage inbounds, clients, panel settings, and Xray configuration as code with Terraform / OpenTofu._

## Support project

**If this project is helpful to you, you may wish to give it a**:star2:

<a href="https://www.buymeacoffee.com/kolxz2" target="_blank">
<img src="./media/default-yellow.png" alt="Buy Me A Coffee" style="height: 70px !important;width: 277px !important;" >
</a>

</br>
<a href="https://nowpayments.io/donation/hsanaei" target="_blank" rel="noreferrer noopener">
   <img src="./media/donation-button-black.svg" alt="Crypto donation button by NOWPayments">
</a>

## Stargazers over Time

[![Stargazers over time](https://starchart.cc/kolxz2/3x-ui.svg?variant=adaptive)](https://starchart.cc/kolxz2/3x-ui)
