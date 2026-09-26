# CLAUDE.md

Guidance for Claude Code working in this repository.

## What this repo is

Source for [homelabcentral.net](https://homelabcentral.net): a Hugo site using
the [Hextra](https://github.com/homelabcentral/hextra) theme. This repo holds
**only source**. The rendered site lives in a separate repository.

See `README.md` for the human-facing overview; this file covers the conventions
and traps that are not obvious from reading the tree.

## Branching: never commit site changes straight to main

Pushing to `main` publishes to the live site. Treat `main` as the release
branch, not the working branch.

For any new article, doc page, layout change or config change:

1. Branch first — `git switch -c post/rack-cooling`, `docs/proxmox-setup`,
   `fix/hero-spacing`. Branch naming is loose; the branching is not.
2. Commit the work there.
3. Push the branch. The build check runs.
4. Open a PR (`gh pr create`) when it is ready to be public.
5. Merge the PR. That merge is the publish.

A local merge followed by `git push origin main` no longer works - the ruleset
rejects it. Merging through a PR is the only route in.

Pushing a feature branch is safe and does nothing to the live site:
`.github/workflows/pages.yml` triggers only on `push` to `main`. What a branch
push does trigger is `.github/workflows/build-check.yml`, which builds the site
with the same flags as the publish job and throws the output away.

`main` is protected by a ruleset: no direct pushes, no force-pushes, no
deletion, and a PR whose "Build site" check has passed. That check name is the
`name:` of the job in build-check.yml - renaming the job detaches the
requirement without any error, so change both together or neither.

On a pull request the check builds the *merge result*, not the branch tip, so a
branch that builds alone but conflicts semantically with current `main` still
fails.

Do not push to `main` without being asked. "Commit this" is not "publish this".

## How publishing works

Two repositories:

| Repository | Holds | Branch |
| --- | --- | --- |
| `homelabcentral/homelabcentral.net` | source (this repo) | `main` |
| `homelabcentral/homelabcentral.github.io` | rendered output only | `main` |

A push to `main` here runs `.github/workflows/pages.yml`, which builds with Hugo
and force-pushes `public/` to `main` of the `.github.io` repo via
`peaceiris/actions-gh-pages`. GitHub Pages serves that branch, and
`static/CNAME` maps it to the apex domain.

Consequences worth remembering:

- `force_orphan: true` — the published repo is rewritten to a single commit on
  every publish. It has no history and is not a place to put anything by hand.
- Auth is an SSH deploy key: private half in the `DEPLOY_KEY` secret here,
  public half a write-enabled deploy key on the `.github.io` repo. Not a PAT.
- `public/` is a build artifact. It is gitignored and must never be committed.
- The publish step cannot be rehearsed locally. `act` would run it for real.
  Verify with `make prod`, which reproduces the CI build command exactly.

## Commands

`make` on its own prints the annotated list, grouped. The ones worth knowing:

```shell
make dev        # authoring: live reload, drafts and future posts, :8043
make preview    # what ships: production env, minified, no drafts, :8043
make prod       # write public/ exactly as CI does
make clean      # remove public/, resources/, .hugo_build.lock
make theme-update  # bump Hextra to the latest tagged release
npm run format  # prettier, including Go templates
```

`make dev` for writing, `make preview` for checking what ships — drafts and
`hugo.IsProduction`-gated features (analytics, among others) behave differently
between them.

### Creating content

```shell
make new-blog   # prompts for title, slug, author, series, tags, cover text
make new-doc    # prompts for title, path, weight
make new-page NAME=showcase/thing   # bare page from archetypes/default.md
```

`new-blog` and `new-doc` write the front matter this site actually uses rather
than `archetypes/default.md`'s four lines, so prefer them over `hugo new` for
those two sections. Every prompt can be pre-answered, which also makes them
usable without a terminal:

```shell
make new-blog TITLE="Rack cooling" TAGS="hardware,cooling" SERIES=Foundation
```

An empty answer omits the key rather than leaving a blank one, and neither
target overwrites an existing file.

### Pull requests and CI

These run `gh`, so they need the dev container — the host's `gh` is
authenticated as a different account and is not a collaborator here.

```shell
make gh-auth    # is gh authenticated, and as whom
make git-auth   # git identity, ssh-agent, origin reachability
make pr TITLE="..."         # open a PR for the current branch
make pr-checks              # watch the Build site gate
make gh-runs BRANCH=main    # Actions runs for any branch, checked out or not
```

`BRANCH=` works on `gh-runs`, `gh-watch` and `gh-rerun`, defaulting to the
current branch; `gh-runs` also takes `STATUS=` and `LIMIT=`. Everything that
changes state on GitHub prompts first and defaults to no — `YES=1` bypasses.

`make gh-dispatch` triggers `pages.yml` by hand. That is the publish, so it is
guarded hardest of all.

## The theme is a Hugo Module

Nothing from the theme is vendored. Hugo resolves
`github.com/homelabcentral/hextra` from `go.mod` into its module cache. There is
no `themes/` directory and no submodule.

To read theme source, `hugo mod vendor` writes it to `_vendor/` — but **delete
it afterwards**. `_vendor/` is gitignored, and while it exists Hugo builds from
it and ignores `go.mod` entirely, silently pinning the theme and making
`make theme-update` a no-op.

Editing a local checkout of the theme changes nothing here until it is tagged
and released.

## Content conventions

New posts go in `content/blog/`, docs in `content/docs/`. `archetypes/default.md`
sets `draft: true`; `hugo new content/blog/slug.md` uses it.

Blog front matter follows `content/blog/what-is-a-homelab.md`: `title`, `date`,
`authors`, optional `series` and `tags`, and `coverText` as a stand-in until
there is a real cover image.

`enableGitInfo: true` means `.Lastmod` comes from the last commit touching the
file, not from front matter. Do not add a `lastmod` key to work around a date
looking wrong — commit properly instead.

### The software section

`content/software/` is a second docs-style section: a category directory per
grouping, each with an `_index.md` whose `cards` grid links to one page per
piece of software. It is a general catalogue of macOS software worth
installing — written for someone setting up a Mac, **not** an inventory of any
particular machine. Do not add "installed here", "on this Mac" or
repo-specific asides; if a fact only holds for one machine or one project, it
does not belong on the page.

**The rules in this file are not page content.** Everything below describes
how to write the section; none of it gets restated on the pages themselves.
No "this is a reference, not a list of things you must have", no "how to read
this", no section explaining what the catalogue excludes and why. A reader
came for the software. Category landing pages get a `lead` and at most two
sentences of substance — not a justification for the category existing.

Every page follows the same shape — a `lead`, a row of source `badge`s, what
the software does, an **Alternative to** table of what people commonly use
instead, an **Install** section with one `tab` per method (Homebrew first
wherever a formula or cask exists), then a `Links` card grid.

The badge row is a single line, one badge per packaged source, each carrying a
`link`: a Homebrew badge points at `formulae.brew.sh/{cask,formula}/<token>`
— or at the tap's repository, for the seven taps with no page there — an App
Store badge at `apps.apple.com/us/app/id<id>`, and a direct-download badge at
the vendor's download page. Software with both a cask and a formula gets both
badges. The badge for the source the page is filed under comes first.

Badge icons are `iconify:devicon-plain/homebrew` and `iconify:charm/download`.
Both are fetched at build time, so the build needs network for them and a typo
in either name fails it rather than rendering blank.

Install routes that are not a place to download from — `cargo install`, an npm
package, a Chrome menu path, an unpatched sibling font — get no badge and stay
in the Install section only.

Category cards carry no `tag`. The badges state distribution; repeating it on
the card was noise.

"Alternative to" is a `borderless-table` shortcode wrapping a three-column
Markdown table — `| Alternative | Type | Trade-off |` — with three to six
rows. It names the incumbent the software competes with rather than every
project in the space, and each row's trade-off is one clause, sentence case.
The trade-off must not restate the `Type` cell: "Paid, and the nicest client"
becomes "The nicest client".

`Type` is how the software is sold, from a closed vocabulary: **Open source**
(free, source public), **Free** (free, proprietary), **Freemium** (free tier
plus a paid tier that matters), **Paid** (one-off), **Subscription**
(recurring only), **Built in** (ships with macOS or Xcode). A row naming
several products joins their labels — `Open source / Freemium` — and a row
that names no product at all takes an em dash. Do not invent a seventh label.

A name that also has a page in this section must carry the same label there
and in every table citing it, or the catalogue contradicts itself.

Every name in the first column links: **to its own page in this section when
it has one**, and to the project's homepage otherwise. Names with nowhere to
point — shell commands, `System Settings → …` paths, phrases like "Doing
nothing" — stay as plain text. A literal `|` inside a cell, even in a code
span, ends the cell: escape it as `\|`.

Where nothing comparable exists, say so as a row (`| Nothing | … |`) rather
than dropping the section — a missing section should mean nobody has filled
it in yet.

Two rules the pages depend on. Cross-links between software pages are written
**absolute** (`/software/input/amphetamine-enhancer/`) because a relative path
resolves against the category directory, not the section. And version numbers
are deliberately absent — `brew info` and the linked release pages are
authoritative, and a hardcoded version is wrong within a week.

Adding a category means giving its `_index.md` the next free `weight`; the
sidebar and breadcrumbs come from the file tree, as everywhere else in Hextra.

## The Hextra skill

The theme repo ships an agent skill covering authoring against Hextra -
shortcodes and their `{{< >}}` vs `{{% %}}` notation, front matter, `hugo.yaml`
params, the blog and docs sections, and icon names. It is generated from the
theme's own shortcode templates, so it describes the version of the theme that
produced it rather than a hand-written approximation.

It is not installed by default. Install it as a plugin, which works on any
machine and inside the dev container:

```shell
/plugin marketplace add homelabcentral/hextra
/plugin install hextra@hextra
```

Pin it to the theme version this site actually uses - the plugin is versioned
alongside the theme, so an upgrade here should be followed by reinstalling the
plugin.

If you are working from a local checkout of the theme and want the unreleased
skill, point the marketplace at the path instead:

```shell
/plugin marketplace add ~/Code/hextra
```

A path-based install only resolves on a machine that has that checkout; inside
the dev container only this repository is mounted, so use the GitHub form there.

Prefer the skill over guessing shortcode syntax. The notation split is the most
common source of broken pages: `details`, `include`, `steps`, `ltr` and `rtl`
take `{{% %}}`, everything else takes `{{< >}}`.

## Editor snippets

`.vscode/hextra.code-snippets` holds 115 snippets for the theme's shortcodes
(markdown scope) and config blocks (yaml scope) - `hxcallout`, `hxcards`,
`hxtabs`, `hxsteps` and so on. They are copied verbatim from the theme repo at
`~/Code/hextra/.vscode/`, so re-syncing is a plain `cp` and a `diff` tells you
whether it is stale.

Prefer them over hand-writing shortcode markup: they get the nesting and the
delimiters right, which is where the four-space trap below bites.

## Traps

**Four-space indentation inside shortcodes.** Several Hextra shortcodes render
their inner content through `markdownify`. Four leading spaces is a Markdown
indented code block, so indenting shortcode contents "for readability" renders
the raw HTML as literal text on the page. Keep inner content flush left.

**`enableGitInfo` hard-fails without a repo.** Not a warning, not a fallback to
file mtime — the build aborts with `failed to load Git data`. Hence
`fetch-depth: 0` in CI; a shallow clone yields wrong dates.

**Three places hold the base URL** and must stay in step: `baseURL` in
`hugo.yaml`, `BASE_URL` in the `Makefile`, and `--baseURL` in
`.github/workflows/pages.yml`. It is hardcoded in CI deliberately — the site is
served from the apex domain, not the `<user>.github.io` path the target repo
would imply.

**Images.** Files under `assets/` go through Hugo's pipeline and can be resized
and converted; files under `static/` are copied verbatim. The blog rail avatar
resolves via `resources.Get`, so its path is relative to `assets/`. The home
hero image is a plain `src` and must live in `static/`, pre-sized — no
processing happens.

**Git identity.** This repo is owned by a different GitHub account than the host
default. `user.name` and `user.email` are set repo-locally, and `origin` uses
the `github-homelabcentral` SSH alias so pushes authenticate as the right
account. Do not "fix" the remote to `git@github.com:` — that silently selects
the wrong key.

## Dev container

Compose-based, in `.devcontainer/`. Two things it does that are easy to break:

- Mounts exactly one SSH key, not the host's `~/.ssh`. `${HOME}/.ssh/`
  `${HOMELABCENTRAL_SSH_KEY:-homelabcentral}` and its `.pub` are bound
  read-only to `~/.ssh/id_container`, and `.devcontainer/ssh-config` — named by
  `IdentityFile` with `IdentitiesOnly yes` — is symlinked over `~/.ssh/config`
  by `postCreateCommand`. The forwarded agent still does the signing; this only
  narrows which identity is offered, and mounting the whole of `~/.ssh` is what
  dragged every other one in. `~/.ssh` itself is a named volume so
  `known_hosts` survives a rebuild. Long syntax, not a mount *string*: a
  string's `readonly` flag is silently dropped on the compose code path, and
  these are real private keys. The host no longer needs
  `IgnoreUnknown UseKeychain` — its config is never parsed here.
- Reads `GH_TOKEN` from `HOMELABCENTRAL_GH_TOKEN` on the host, exported from
  `~/.zshrc` behind a `VSCODE_RESOLVING_ENVIRONMENT` guard. The rename keeps the
  host's own `gh` credentials untouched.

If `GH_TOKEN` is empty in the container, the usual cause is VS Code's cached
shell environment, which is resolved once per app session. Quit VS Code fully
and relaunch — Reload Window and Rebuild Container both reuse the cache.

## Skill routing

When the user's request matches an available skill, invoke it via the Skill tool. When in doubt, invoke the skill.

Key routing rules:
- Product ideas/brainstorming → invoke /office-hours
- Strategy/scope → invoke /plan-ceo-review
- Architecture → invoke /plan-eng-review
- Design system/plan review → invoke /design-consultation or /plan-design-review
- Full review pipeline → invoke /autoplan
- Bugs/errors → invoke /investigate
- QA/testing site behavior → invoke /qa or /qa-only
- Code review/diff check → invoke /review
- Visual polish → invoke /design-review
- Ship/deploy/PR → invoke /ship or /land-and-deploy
- Save progress → invoke /context-save
- Resume context → invoke /context-restore
- Author a backlog-ready spec/issue → invoke /spec
