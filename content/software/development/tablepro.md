---
title: "TablePro"
weight: 6
description: "Native macOS client for many database engines."
---

{{< lead >}}One native window for PostgreSQL, MySQL, SQLite and the rest, instead of an Electron app per engine.{{< /lead >}}

{{< badge content="Homebrew cask" color="blue" icon="iconify:devicon-plain/homebrew" link="https://formulae.brew.sh/cask/tablepro" >}} {{< badge content="Direct download" color="orange" icon="iconify:charm/download" link="https://tablepro.app/" >}}

## What it does

TablePro is a native database client: connect to a server, browse schemas and tables, edit rows in a spreadsheet-style grid, and run SQL with results in a pane beside it. It covers the common engines — PostgreSQL, MySQL/MariaDB, SQLite, and others — from a single UI.

For a homelab it is the fastest way to look inside whatever a self-hosted service is storing: a Grafana or Home Assistant SQLite file, a Postgres container behind an app, a MySQL database in a stack you inherited.

## Notes

The app updates itself, so Homebrew's recorded version lags the installed one.

## Alternative to

{{< borderless-table >}}
| Alternative | Type | Trade-off |
| --- | --- | --- |
| [TablePlus](https://tableplus.com/) | Freemium | The best-known native Mac client; paid, similar breadth |
| [DBeaver](https://dbeaver.io/) | Open source | Java-based, supports practically every engine ever made |
| [DataGrip](https://www.jetbrains.com/datagrip/) | Paid | JetBrains' client, with the strongest SQL editor of the group |
| [Beekeeper Studio](https://www.beekeeperstudio.io/) | Open source | Lighter |
| [Postico](https://eggerapps.at/postico2/) or [Sequel Ace](https://sequel-ace.com/) | Paid | Single-engine clients for PostgreSQL and MySQL |
{{< /borderless-table >}}

## Install

{{< tabs >}}
{{< tab name="Homebrew" selected=true >}}

```shell
brew install --cask tablepro
```

{{< /tab >}}
{{< tab name="Direct download" >}}

[Download from the developer](https://tablepro.app/)

{{< /tab >}}
{{< /tabs >}}

## Links

{{< cards cols="2" >}}
{{< card link="https://tablepro.app/" title="Homepage" icon="globe-alt" subtitle="Official site" >}}
{{< card link="https://formulae.brew.sh/cask/tablepro" title="Homebrew cask" icon="cube" subtitle="Cask definition and versions" >}}
{{< /cards >}}
