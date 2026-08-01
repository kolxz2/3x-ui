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
<<<<<<< HEAD
  <a href="https://pkg.go.dev/github.com/kolxz2/3x-ui/v3"><img src="https://pkg.go.dev/badge/github.com/kolxz2/3x-ui/v3.svg" alt="Go Reference"></a>
  <a href="https://goreportcard.com/report/github.com/kolxz2/3x-ui/v3"><img src="https://goreportcard.com/badge/github.com/kolxz2/3x-ui/v3" alt="Go Report Card"></a>
=======
  <a href="https://pkg.go.dev/github.com/kolxz2/3x-ui/v3"><img src="https://pkg.go.dev/badge/github.com/kolxz2/3x-ui/v3.svg" alt="Go Reference"></a>
>>>>>>> upstream/main
</p>

**3X-UI** — продвинутая веб-панель управления с открытым исходным кодом для управления серверами [Xray-core](https://github.com/XTLS/Xray-core). Она предоставляет аккуратный многоязычный интерфейс для развёртывания, настройки и мониторинга широкого спектра протоколов прокси и VPN — от одного VPS до развёртываний с несколькими узлами.

Созданный как улучшенный форк оригинального проекта X-UI, 3X-UI добавляет более широкую поддержку протоколов, повышенную стабильность, учёт трафика по каждому клиенту и множество функций для удобства использования.

> [!IMPORTANT]
> Этот проект предназначен только для личного использования. Пожалуйста, не используйте его в незаконных целях или в производственной среде.

## Возможности

- **Многопротокольные входящие подключения** — VLESS, VMess, Trojan, Shadowsocks, WireGuard, Hysteria2, HTTP, SOCKS (Mixed), Dokodemo-door / Tunnel и TUN.
- **Современные транспорты и безопасность** — TCP (Raw), mKCP, WebSocket, gRPC, HTTPUpgrade и XHTTP, защищённые с помощью TLS, XTLS и REALITY.
- **Fallback** — обслуживание нескольких протоколов на одном порту (например, VLESS и Trojan на 443) с помощью функции fallback в Xray.
- **Управление по каждому клиенту** — квоты трафика, даты истечения, лимиты IP, статус «онлайн» в реальном времени, а также ссылки для общего доступа, QR-коды и подписки в один клик.
- **Статистика трафика** — по каждому входящему, по каждому клиенту и по каждому исходящему, с возможностью сброса.
- **Поддержка нескольких узлов** — управление и масштабирование на несколько серверов из одной панели.
- **Исходящие подключения и маршрутизация** — WARP, NordVPN, пользовательские правила маршрутизации, балансировщики нагрузки и цепочки исходящих прокси.
- **Встроенный сервер подписок** с несколькими форматами вывода и [пользовательскими шаблонами страниц](docs/custom-subscription-templates.md).
- **Telegram-бот** для удалённого мониторинга и управления.
- **RESTful API** с документацией Swagger внутри панели.
- **Гибкое хранилище** — SQLite (по умолчанию) или PostgreSQL.
- **13 языков интерфейса** с тёмной и светлой темами.
- **Интеграция с Fail2ban** для применения лимитов IP по каждому клиенту.

## Скриншоты

<details>
<summary>Нажмите, чтобы развернуть</summary>

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

## Быстрый старт

```bash
bash <(curl -Ls https://raw.githubusercontent.com/kolxz2/3x-ui/master/install.sh)
```

Чтобы установить конкретную версию, добавьте её тег (например, `v3.4.0`):

```bash
bash <(curl -Ls https://raw.githubusercontent.com/kolxz2/3x-ui/master/install.sh) v3.4.0
```

Чтобы установить скользящую **dev**-сборку (новейший предварительный релиз по каждому коммиту из ветки `main`, а не стабильный релиз), передайте `dev-latest`:

```bash
bash <(curl -Ls https://raw.githubusercontent.com/kolxz2/3x-ui/master/install.sh) dev-latest
```

Во время установки генерируются случайные имя пользователя, пароль и путь доступа. После установки выполните `x-ui`, чтобы открыть меню управления, где можно запускать/останавливать сервис, просматривать или сбрасывать учётные данные для входа, управлять SSL-сертификатами и многое другое.

Полную документацию смотрите в [вики проекта](https://github.com/kolxz2/3x-ui/wiki).

### Автоматическая установка

Установщик также работает в **неинтерактивном** режиме для cloud-init.
Задайте `XUI_NONINTERACTIVE=1` (или передайте по конвейеру без TTY), и установка пройдёт от начала до конца
без единого запроса: будут сгенерированы случайные учётные данные и записаны в
`/etc/x-ui/install-result.env`. Смотрите [`deploy/`](deploy/) для:

- [Cloud-init user-data](deploy/cloud-init/) — автоматическая установка в любом облаке (Hetzner/AWS/DO/Vultr/GCP/Azure/Oracle)
- [Заметки по Hetzner Cloud](deploy/marketplace/hetzner/) — развёртывание на Hetzner на базе cloud-init

## Поддерживаемые платформы

**Операционные системы:** Ubuntu, Debian, Armbian, Fedora, CentOS, RHEL, AlmaLinux, Rocky Linux, Oracle Linux, Amazon Linux, Virtuozzo, Arch, Manjaro, Parch, openSUSE (Tumbleweed / Leap), Alpine и Windows.

**Архитектуры:** `amd64` · `386` · `arm64` (aarch64) · `armv7` · `armv6` · `armv5` · `s390x`.

## Варианты базы данных

3X-UI поддерживает два бэкенда, выбираемых при установке:

- **SQLite** (по умолчанию) — единый файл по пути `/etc/x-ui/x-ui.db`. Без настройки, идеально для небольших и средних развёртываний.
- **PostgreSQL** — рекомендуется при большом числе клиентов или конфигурациях с несколькими узлами. Установщик может установить PostgreSQL локально за вас или принять DSN к существующему серверу.

Во время выполнения бэкенд выбирается через переменные окружения (установщик записывает их за вас в `/etc/default/x-ui`):

```
XUI_DB_TYPE=postgres
XUI_DB_DSN=postgres://xui:password@127.0.0.1:5432/xui?sslmode=disable
```

### Перенос существующей установки SQLite в PostgreSQL

```bash
x-ui migrate-db --dsn "postgres://xui:password@127.0.0.1:5432/xui?sslmode=disable"
# затем задайте XUI_DB_TYPE и XUI_DB_DSN в /etc/default/x-ui и перезапустите:
systemctl restart x-ui
```

Исходный файл SQLite остаётся нетронутым; удалите его вручную после проверки нового бэкенда.

### Редактирование правил маршрутизации подписки (`subJsonRules`) через SQLite

Инструкция только для установки с **SQLite** (`/etc/x-ui/x-ui.db`). На время правки базы лучше не менять настройки в панели параллельно.

#### 📦 1. Установка `sqlite3` на сервер

**Ubuntu / Debian:**

```bash
apt update
apt install sqlite3 -y
```

Проверка:

```bash
sqlite3 --version
```

#### 📂 2. Открыть базу 3X-UI

Файл базы: `/etc/x-ui/x-ui.db`

```bash
sqlite3 /etc/x-ui/x-ui.db
```

#### 🔍 3. Проверить, что всё в порядке

Внутри `sqlite3`:

```sql
.tables
```

Должны отображаться таблицы `settings`, `inbounds` и другие.

#### 📥 4. Посмотреть текущие правила подписки

```sql
SELECT value FROM settings WHERE key='subJsonRules';
```

Скопируйте результат — это резервная копия на случай отката.

#### ✏️ 5. Обновить rules (добавить домены)

Подставьте свой JSON при необходимости. Пример синхронизирован с [`amnezia_sites.json`](amnezia_sites.json) (список Amnezia): каждый `hostname` → правило `domain:`, уникальные IP из файла — запасной вариант. Базовые правила: `2ip.ru` / `mp-raketa.ru` → proxy; `geoip:private` + `geoip:ru` и `geosite:category-ru` → direct; остальное → proxy.

Пересобрать JSON после правки `amnezia_sites.json`: `node scripts/gen-sub-json-rules.mjs`

```sql
UPDATE settings
SET value='[{"type":"field","domain":["domain:2ip.ru","domain:mp-raketa.ru"],"network":"tcp,udp","outboundTag":"proxy"},{"type":"field","ip":["geoip:private","geoip:ru"],"outboundTag":"direct"},{"type":"field","domain":["geosite:category-ru","domain:xn--p1ai","domain:by","keyword:kinozal","keyword:nnmclub","domain:a.wb.ru","domain:am.wildberries.ru","domain:api.plus.kinopoisk.ru","domain:app.e-comet.io","domain:avatars.mds.yandex.net","domain:basket-38.wbbasket.ru","domain:by.wildberries.ru","domain:career.hh.ru","domain:cdn-assets.setka.ru","domain:cdn.setka.ru","domain:cdn.uxfeedback.ru","domain:cdn.wbbasket.ru","domain:cdn1.ozonusercontent.com","domain:cdn2.ozone.ru","domain:chat-prod.wildberries.ru","domain:chat.e-comet.io","domain:chat.wildberries.ru","domain:cmp-new.wildberries.ru","domain:cmp.wildberries.ru","domain:data-checker.wildberries.ru","domain:delivery-bt.wildberries.ru","domain:disk.hh.ru","domain:e-comet.io","domain:ext-strm-rukzn04mts-01.strm.yandex.net","domain:graphql.kinopoisk.ru","domain:hd.kinopoisk.ru","domain:hh.ru","domain:hhcdn.ru","domain:highlight.wildberries.ru","domain:i.hh.ru","domain:identical-products.wildberries.ru","domain:installments-aggregator-bt.wildberries.ru","domain:ir-11.ozone.ru","domain:ir.ozone.ru","domain:journal-bt.wildberries.ru","domain:kg.wildberries.ru","domain:kz.wildberries.ru","domain:log.strm.yandex.ru","domain:marketplace-sentry.wb.ru","domain:mc.yandex.com","domain:mc.yandex.ru","domain:ozon.by","domain:ozon.ru","domain:points.wb.ru","domain:questions.wildberries.ru","domain:seller-auth.wildberries.ru","domain:seller.ozon.ru","domain:seller.wildberries.ru","domain:setka.ru","domain:st.ozone.ru","domain:static-basket-01.wbbasket.ru","domain:static-mon.yandex.net","domain:strm.yandex.ru","domain:suppliers-shipment-2.wildberries.ru","domain:tracking.ott.yandex.net","domain:user-features.wb.ru","domain:userstorage-02adm.wb.ru","domain:v-1.ozone.ru","domain:wbx-bell-v3.wildberries.ru","domain:wbxoofex.wildberries.ru","domain:wildberries.by","domain:wildberries.ru","domain:www.ozon.ru","domain:www.wildberries.by","domain:www.wildberries.ru","domain:xapi.ozon.ru","domain:yandex.ru","domain:yastatic.net"],"outboundTag":"direct"},{"type":"field","network":"tcp,udp","outboundTag":"proxy"}]'
WHERE key='subJsonRules';
```

Те же правила можно задать в панели: **Настройки → Форматы подписки**, если включён JSON-формат подписки.

#### 💾 6. Выйти из `sqlite3`

```text
.exit
```

#### 🔄 7. Перезапустить 3X-UI

```bash
systemctl restart x-ui
```

### Docker

Команда по умолчанию `docker compose up -d` продолжает использовать SQLite. Чтобы запустить со встроенным сервисом PostgreSQL, раскомментируйте две строки переменных окружения `XUI_DB_*` в `docker-compose.yml` и запустите с профилем:

```bash
docker compose --profile postgres up -d
```

Образ включает Fail2ban (включён по умолчанию) для применения **лимитов IP** по каждому клиенту. Fail2ban блокирует нарушителей с помощью `iptables`, что требует возможности `NET_ADMIN`. `docker-compose.yml` уже предоставляет её через `cap_add`; если вы вместо этого запускаете контейнер через `docker run`, добавьте возможности самостоятельно, иначе блокировки будут регистрироваться, но никогда не применяться:

```bash
docker run -d --cap-add=NET_ADMIN --cap-add=NET_RAW ... ghcr.io/kolxz2/3x-ui
```

## Переменные окружения

| Переменная | Описание | По умолчанию |
| --- | --- | --- |
| `XUI_DB_TYPE` | Бэкенд базы данных: `sqlite` или `postgres` | `sqlite` |
| `XUI_DB_DSN` | Строка подключения PostgreSQL (когда `XUI_DB_TYPE=postgres`) | — |
| `XUI_DB_FOLDER` | Каталог для файла базы данных SQLite | `/etc/x-ui` |
| `XUI_DB_MAX_OPEN_CONNS` | Максимум открытых соединений (пул PostgreSQL) | — |
| `XUI_DB_MAX_IDLE_CONNS` | Максимум простаивающих соединений (пул PostgreSQL) | — |
| `XUI_INIT_WEB_BASE_PATH` | Начальный URI-путь для веб-панели | `/` |
| `XUI_ENABLE_FAIL2BAN` | Включить применение лимитов IP на основе Fail2ban | `true` |
| `XUI_LOG_LEVEL` | Уровень логирования (`debug`, `info`, `warning`, `error`) | `info` |
| `XUI_DEBUG` | Включить режим отладки | `false` |
| `XUI_TUNNEL_HEALTH_MONITOR` | Включить монитор состояния туннеля (опрашивает URL и перезапускает xray после многократных сбоев; перезапуск отключает всех клиентов) | `false` |
| `XUI_TUNNEL_HEALTH_PROXY` | Прокси, через который отправляется проба; укажите локальный входящий xray, чтобы проба проверяла туннель (например, `socks5://127.0.0.1:1080`). Пустое значение означает, что проба проверяет только связь с хостом | — |
| `XUI_TUNNEL_HEALTH_URL` | URL, опрашиваемый для проверки состояния туннеля | `https://www.cloudflare.com/cdn-cgi/trace` |
| `XUI_TUNNEL_HEALTH_INTERVAL` | Интервал между пробами | `30s` |
| `XUI_TUNNEL_HEALTH_TIMEOUT` | Таймаут на одну пробу | `10s` |
| `XUI_TUNNEL_HEALTH_FAILURES` | Число последовательных сбоев до запуска перезапуска | `3` |
| `XUI_TUNNEL_HEALTH_COOLDOWN` | Минимальная задержка между последовательными перезапусками | `5m` |

## Поддерживаемые языки

Интерфейс панели доступен на 13 языках:

English · فارسی · العربية · 中文（简体） · 中文（繁體） · Español · Русский · Українська · Türkçe · Tiếng Việt · 日本語 · Bahasa Indonesia · Português (Brasil)

## Форк: обновление и релизы

Этот репозиторий — форк [MHSanaei/3x-ui](https://github.com/kolxz2/3x-ui). Ниже — как подтянуть изменения из оригинала и как публиковать сборки через GitHub Actions ([`release.yml`](/.github/workflows/release.yml)) для **вашего форка** (`kolxz2/3x-ui`).

### Обновить форк из upstream

Проверьте remotes:

```bash
git remote -v
```

Если `upstream` ещё нет, добавьте оригинальный репозиторий:

```bash
git remote add upstream https://github.com/kolxz2/3x-ui.git
```

Проверьте:

```bash
git remote -v
```

Должно быть примерно так:

```text
origin    https://github.com/kolxz2/3x-ui.git (fetch)
origin    https://github.com/kolxz2/3x-ui.git (push)
upstream  https://github.com/kolxz2/3x-ui.git (fetch)
upstream  https://github.com/kolxz2/3x-ui.git (push)
```

Загрузите последние изменения из оригинала:

```bash
git fetch upstream
```

Посмотрите удалённые ветки:

```bash
git branch -r
```

**Вариант 1 — merge (проще).** На своей машине, в ветке `main`:

```bash
git checkout main
git merge upstream/main
git push origin main
```

При конфликтах слияния разрешите их, сделайте commit и снова выполните `git push origin main`.

**Вариант 2 — rebase (линейная история).** Только если вы уверенно работаете с rebase:

```bash
git checkout main
git rebase upstream/main
git push origin main
```

Если `main` уже был на GitHub, после rebase может понадобиться `git push --force-with-lease origin main` — используйте это только когда намеренно переписываете историю на remote.

Код upstream лежит в `internal/` (не в старых каталогах `web/`, `database/`, `xray/`). Файл версии: [`internal/config/version`](internal/config/version).

### Опубликовать релиз с бинарниками

**Создавать Release вручную в интерфейсе GitHub не обязательно.** Workflow **Release 3X-UI** собирает архивы для Linux/Windows и прикрепляет их к релизу после **push тега версии**.

1. Обновите версию в [`internal/config/version`](internal/config/version) (должна совпадать с тегом, **без** префикса `v`) и закоммитьте изменения.
2. Отправьте на форк:

   ```bash
   git push origin main
   ```

3. Создайте и запушьте тег с префиксом **`v`** (это требование workflow), например `v3.6.0`:

   ```bash
   git tag v3.6.0
   git push origin v3.6.0
   ```

   Теги вида `3.6.0` **без** `v` **не** загрузят файлы в [Releases](https://github.com/kolxz2/3x-ui/releases).

4. Дождитесь завершения workflow во вкладке [Actions](https://github.com/kolxz2/3x-ui/actions) (~10–15 минут). Затем откройте **Releases** — там должны появиться `x-ui-linux-amd64.tar.gz`, `x-ui-windows-amd64.zip` и другие платформы.

Workflow также запускается при push в `main`, если менялись `.go`, `go.mod`, `frontend/`, `*.sh` и т.п.; тогда артефакты лежат только в **Actions → Artifacts**. **На страницу Releases файлы попадают только при push тега** (`refs/tags/v…`).

Сборка без тега: **Actions → Release 3X-UI → Run workflow** (`workflow_dispatch`).

## Участие в разработке

Вклад приветствуется. Пожалуйста, прочитайте [руководство по участию](/CONTRIBUTING.md), прежде чем открывать issue или pull request.

## Особая благодарность

- [alireza0](https://github.com/alireza0/)

## Благодарности

- [Iran v2ray rules](https://github.com/chocolate4u/Iran-v2ray-rules) (Лицензия: **GPL-3.0**): _Улучшенные правила маршрутизации для v2ray/xray и v2ray/xray-clients со встроенными иранскими доменами и фокусом на безопасность и блокировку рекламы._
- [Russia v2ray rules](https://github.com/runetfreedom/russia-v2ray-rules-dat) (Лицензия: **GPL-3.0**): _Этот репозиторий содержит автоматически обновляемые правила маршрутизации V2Ray на основе данных о заблокированных доменах и адресах в России._

## Инструменты сообщества

Инструменты и интеграции, созданные сообществом вокруг 3x-ui.

- [terraform-provider-3x-ui](https://github.com/batonogov/terraform-provider-threexui) (Лицензия: **MIT**): _Управление входящими, клиентами, настройками панели и конфигурацией Xray через код с помощью Terraform / OpenTofu._

## Поддержка проекта

**Если этот проект полезен для вас, вы можете поставить ему**:star2:

<a href="https://www.buymeacoffee.com/kolxz2" target="_blank">
<img src="./media/default-yellow.png" alt="Buy Me A Coffee" style="height: 70px !important;width: 277px !important;" >
</a>

</br>
<a href="https://nowpayments.io/donation/hsanaei" target="_blank" rel="noreferrer noopener">
   <img src="./media/donation-button-black.svg" alt="Crypto donation button by NOWPayments">
</a>

## Звезды с течением времени

[![Stargazers over time](https://starchart.cc/kolxz2/3x-ui.svg?variant=adaptive)](https://starchart.cc/kolxz2/3x-ui)
