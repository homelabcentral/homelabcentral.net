# homelabcentral.net
#
# One server, one port. Hugo serves on 8043 - that is the only port the dev
# container forwards. Nothing serves `public/`; it is a build artifact, written
# by whichever of these ran last. `make prod` is the one that writes it the way
# CI does, so re-run that before trusting what is in there.
#

# Run `make` on its own for the annotated list. A `## comment` after a target
# name puts it there; a `##@ heading` starts a group.

.DEFAULT_GOAL := help

# bash rather than sh, with -e so a failing step in a multi-line recipe stops
# the recipe instead of carrying on into a bad state, and -o pipefail so a
# failure on the left of a pipe is not hidden by a zero exit on the right.
# -u is deliberately NOT set: several recipes read optional variables that are
# legitimately empty.
SHELL := /bin/bash
.SHELLFLAGS := -e -o pipefail -c

# ---------------------------------------------------------------- configuration

PORT ?= 8043

# The site's production base URL, used by `prod` and `preview`. Overridable:
# `make prod BASE_URL=https://staging.example.com/`. Keep the trailing slash -
# Hugo joins paths onto it directly. This must stay in step with `baseURL` in
# hugo.yaml and with the --baseURL in .github/workflows/pages.yml.
BASE_URL ?= https://homelabcentral.net/

# The GitHub account that owns this repository. `gh-auth` compares the
# authenticated login against it, because the host's gh is usually a different
# account and its failure message does not say so.
GH_OWNER ?= homelabcentral

# Default base branch for pull requests.
BASE ?= main

# Opt-in destination pruning: `make build CLEAN=1`.
#
# --cleanDestinationDir deletes anything in public/ this build did not produce -
# renamed pages, stale fingerprinted CSS, whatever `make dev` left behind with
# its localhost baseURL. Off by default because it deletes files it did not
# create, so it should be a decision rather than a default.
#
# Different from --gc, which clears the resources/ cache and never touches the
# destination. `make clean` is stricter still: it removes both outright.
CLEAN ?= 0
CLEAN_DEST := $(if $(filter 1 true yes on,$(CLEAN)),--cleanDestinationDir,)

# Colours, but only when stdout is a TTY, so piped output and CI logs stay clean.
ifneq (,$(findstring xterm,$(TERM)))
  BOLD   := $(shell tput bold)
  DIM    := $(shell tput dim)
  RED    := $(shell tput setaf 1)
  GREEN  := $(shell tput setaf 2)
  YELLOW := $(shell tput setaf 3)
  BLUE   := $(shell tput setaf 4)
  RESET  := $(shell tput sgr0)
endif

# Message helpers. Used as `@$(SAY) "text"` rather than `$(call ...)` so that a
# comma inside a message is not parsed as another argument.
SAY  := printf "$(BLUE)==>$(RESET) $(BOLD)%s$(RESET)\n"
OK   := printf "$(GREEN)  ok$(RESET) %s\n"
WARN := printf "$(YELLOW)  !!$(RESET) %s\n"
ERR  := printf "$(RED)  xx$(RESET) %s\n"

# Interactive guard for anything that changes state on GitHub. $(1) is the
# question; keep it free of commas, which `call` would read as another argument.
# YES=1, YES=true and YES=yes bypass it and nothing else does, so a mistyped
# YES=maybe still asks. Without a terminal and without YES it aborts rather than
# blocking on a prompt nobody can answer.
define CONFIRM
	@if [ "$(YES)" = "1" ] || [ "$(YES)" = "true" ] || [ "$(YES)" = "yes" ]; then \
	  $(WARN) "confirmation bypassed - YES=$(YES)"; \
	else \
	  if [ ! -t 0 ]; then \
	    $(WARN) "no terminal to confirm on - pass YES=1 to proceed"; exit 1; \
	  fi; \
	  printf "$(YELLOW)  ??$(RESET) $(BOLD)%s$(RESET) $(DIM)[y/N]$(RESET) " "$(1)"; \
	  read -r reply; \
	  case "$$reply" in [yY]|[yY][eE][sS]) ;; *) $(WARN) "aborted"; exit 1 ;; esac; \
	fi
endef

# ----------------------------------------------------------------------- help

.PHONY: help
help: ## Show this help
	@awk 'BEGIN {FS = ":.*?## "} \
		/^[a-zA-Z_-]+:.*?## / { printf "  $(GREEN)%-16s$(RESET) %s\n", $$1, $$2 } \
		/^##@/ { printf "\n$(BOLD)%s$(RESET)\n", substr($$0, 5) }' $(MAKEFILE_LIST)

##@ Develop

.PHONY: dev
dev: ## Serve on :8043 with live reload, drafts and future posts
	hugo server --disableFastRender -D -F --port $(PORT) --bind 0.0.0.0

# --appendPort=false is required for the baseURL to stay clean; without it the
# server advertises the base URL with the port glued on. The cost is LiveReload:
# Hugo builds the injected websocket URL from the baseURL, so stripping the port
# leaves it empty and auto-refresh stops working. Acceptable here and not on
# `dev` - this target is for inspecting output, not for editing against.
.PHONY: preview
preview: ## Serve on :8043 as production: real baseURL, minified, no drafts
	hugo server --environment production --minify \
	  --baseURL "$(BASE_URL)" --appendPort=false \
	  --port $(PORT) --bind 0.0.0.0

##@ Content

# These prompt for every field and write the file themselves rather than going
# through `hugo new`, because the blog front matter this site actually uses -
# authors, series, tags, coverText - is richer than archetypes/default.md and
# half of it is optional. An empty answer omits the key rather than leaving a
# blank one behind.
#
# Every prompt can be pre-answered from the command line, which also makes the
# targets usable without a terminal:
#
#   make new-blog TITLE="Rack cooling" TAGS="hardware,cooling" SERIES=Foundation
#
# SLUG defaults to a slugified TITLE. Nothing is overwritten: an existing file
# aborts the target.

.PHONY: new-blog
new-blog: ## Create a blog post, prompting for front matter: make new-blog [TITLE=...]
	@title="$(TITLE)"; \
	 if [ -z "$$title" ]; then \
	   if [ ! -t 0 ]; then $(ERR) "TITLE required when there is no terminal"; exit 1; fi; \
	   printf "  $(BOLD)Title$(RESET) $(DIM)(e.g. Rack cooling on a budget)$(RESET)\n  > "; \
	   read -r title; \
	 fi; \
	 if [ -z "$$title" ]; then $(ERR) "a title is required"; exit 1; fi; \
	 slug="$(SLUG)"; \
	 default_slug="$$(printf '%s' "$$title" | tr '[:upper:]' '[:lower:]' \
	   | sed -E 's/[^a-z0-9]+/-/g; s/^-+//; s/-+$$//')"; \
	 if [ -z "$$slug" ] && [ -t 0 ]; then \
	   printf "  $(BOLD)Slug$(RESET) $(DIM)[$$default_slug]$(RESET)\n  > "; read -r slug; \
	 fi; \
	 [ -n "$$slug" ] || slug="$$default_slug"; \
	 path="content/blog/$${slug%.md}.md"; \
	 if [ -e "$$path" ]; then $(ERR) "$$path already exists"; exit 1; fi; \
	 author="$(AUTHOR)"; \
	 if [ -z "$$author" ] && [ -t 0 ]; then \
	   printf "  $(BOLD)Author$(RESET) $(DIM)[Homelab Central]$(RESET)\n  > "; read -r author; \
	 fi; \
	 [ -n "$$author" ] || author="Homelab Central"; \
	 series="$(SERIES)"; \
	 if [ -z "$$series" ] && [ -t 0 ]; then \
	   printf "  $(BOLD)Series$(RESET) $(DIM)(blank for none - e.g. Foundation)$(RESET)\n  > "; \
	   read -r series; \
	 fi; \
	 tags="$(TAGS)"; \
	 if [ -z "$$tags" ] && [ -t 0 ]; then \
	   printf "  $(BOLD)Tags$(RESET) $(DIM)(comma separated - reuse existing spellings)$(RESET)\n  > "; \
	   read -r tags; \
	 fi; \
	 cover="$(COVER_TEXT)"; \
	 if [ -z "$$cover" ] && [ -t 0 ]; then \
	   printf "  $(BOLD)Cover text$(RESET) $(DIM)[$$slug]$(RESET)\n  > "; read -r cover; \
	 fi; \
	 [ -n "$$cover" ] || cover="$$(printf '%s' "$$slug" | tr '-' ' ')"; \
	 { \
	   echo '---'; \
	   printf 'title: "%s"\n' "$$title"; \
	   printf 'date: %s\n' "$$(date +%Y-%m-%d)"; \
	   echo 'draft: true'; \
	   echo 'authors:'; \
	   printf '  - name: %s\n' "$$author"; \
	   if [ -n "$$series" ]; then echo 'series:'; printf '  - %s\n' "$$series"; fi; \
	   if [ -n "$$tags" ]; then \
	     echo 'tags:'; \
	     printf '%s\n' "$$tags" | tr ',' '\n' \
	       | sed -E 's/^[[:space:]]+//; s/[[:space:]]+$$//; /^$$/d; s/^/  - /'; \
	   fi; \
	   echo 'excludeSearch: false'; \
	   echo '# `coverText` renders in the card cover slot with the prompt glyph from'; \
	   echo '# params.command.prompt until there is a real cover image.'; \
	   echo 'coverText: |'; \
	   printf '  %s\n' "$$cover"; \
	   echo '---'; \
	   echo ''; \
	   echo 'The text above the marker below is the excerpt shown on the blog list.'; \
	   echo ''; \
	   echo '<!--more-->'; \
	   echo ''; \
	   echo '## First section'; \
	   echo ''; \
	 } > "$$path"; \
	 $(OK) "created $$path"; \
	 $(WARN) "draft: true - visible under make dev, excluded from make prod"

.PHONY: new-doc
new-doc: ## Create a docs page, prompting for front matter: make new-doc [TITLE=...]
	@title="$(TITLE)"; \
	 if [ -z "$$title" ]; then \
	   if [ ! -t 0 ]; then $(ERR) "TITLE required when there is no terminal"; exit 1; fi; \
	   printf "  $(BOLD)Title$(RESET) $(DIM)(e.g. Proxmox setup)$(RESET)\n  > "; read -r title; \
	 fi; \
	 if [ -z "$$title" ]; then $(ERR) "a title is required"; exit 1; fi; \
	 slug="$(SLUG)"; \
	 default_slug="$$(printf '%s' "$$title" | tr '[:upper:]' '[:lower:]' \
	   | sed -E 's/[^a-z0-9]+/-/g; s/^-+//; s/-+$$//')"; \
	 if [ -z "$$slug" ] && [ -t 0 ]; then \
	   printf "  $(BOLD)Path under content/docs$(RESET) $(DIM)[$$default_slug]$(RESET)\n  > "; \
	   read -r slug; \
	 fi; \
	 [ -n "$$slug" ] || slug="$$default_slug"; \
	 path="content/docs/$${slug%.md}.md"; \
	 if [ -e "$$path" ]; then $(ERR) "$$path already exists"; exit 1; fi; \
	 weight="$(WEIGHT)"; \
	 if [ -z "$$weight" ] && [ -t 0 ]; then \
	   printf "  $(BOLD)Weight$(RESET) $(DIM)(blank to leave unordered - lower sorts first)$(RESET)\n  > "; \
	   read -r weight; \
	 fi; \
	 mkdir -p "$$(dirname "$$path")"; \
	 { \
	   echo '---'; \
	   printf 'title: "%s"\n' "$$title"; \
	   if [ -n "$$weight" ]; then printf 'weight: %s\n' "$$weight"; fi; \
	   echo '---'; \
	   echo ''; \
	   echo '## First section'; \
	   echo ''; \
	 } > "$$path"; \
	 $(OK) "created $$path"; \
	 if [ -z "$$weight" ]; then \
	   $(WARN) "no weight set - the sidebar will fall back to alphabetical order"; \
	 fi; \
	 case "$$slug" in */*) \
	   $(WARN) "new section: it needs a content/docs/$$(dirname "$$slug")/_index.md"; \
	   $(WARN) "a section with no _index.md loses its sidebar children" ;; \
	 esac

.PHONY: new-page
new-page: ## Create a bare page from archetypes/default.md: make new-page NAME=showcase/thing
	@if [ -z "$(NAME)" ]; then $(ERR) "NAME required, e.g. make new-page NAME=showcase/thing"; exit 1; fi
	@hugo new "content/$(patsubst %.md,%,$(NAME)).md"

##@ Build

.PHONY: build
build: ## Write public/ (add CLEAN=1 to prune files this build did not produce)
	hugo --gc --minify $(CLEAN_DEST)

.PHONY: prod
prod: ## Write public/ as CI does, at $(BASE_URL) (add CLEAN=1 to prune)
	hugo --gc --minify $(CLEAN_DEST) --baseURL "$(BASE_URL)"

.PHONY: clean
clean: ## Remove build output
	rm -rf public resources .hugo_build.lock

##@ Theme

# Reads the pinned version out of go.mod by scanning fields rather than a
# fixed column, so it works with both the single-line `require` form and a
# `require (...)` block. `hugo mod get -u` itself only speaks up when it
# changes something - a no-op upgrade is silent, which reads the same as a
# failure. Comparing before and after makes "already current" explicit.
THEME := github.com/homelabcentral/hextra
theme_version = $(shell awk '{for (i = 1; i <= NF; i++) if ($$i == "$(THEME)") print $$(i + 1)}' go.mod)

.PHONY: theme-update
theme-update: ## Bump Hextra to the latest tagged release
	@before='$(theme_version)'; \
	hugo mod get -u $(THEME); \
	after=$$(awk '{for (i = 1; i <= NF; i++) if ($$i == "$(THEME)") print $$(i + 1)}' go.mod); \
	if [ "$$before" = "$$after" ]; then \
	  echo "Hextra already at $$after - no newer tagged release."; \
	else \
	  echo "Hextra updated: $$before => $$after"; \
	fi
	@echo "Pin a specific version instead with:"
	@echo "  hugo mod get $(THEME)@vX.Y.Z"

##@ GitHub

# Pull requests, driven by `gh` from inside the dev container.
#
# main is protected by a ruleset: no direct pushes, no force-pushes, and a PR
# whose "Build site" check has passed. Merging that PR is the publish, so these
# targets are the only route a change takes to the live site.
#
# Nothing here reads, echoes, masks or length-checks GH_TOKEN. Presence is
# tested with [ -n ] and identity is asked of GitHub, which answers with a
# login. `gh auth status` is silenced because it renders a masked token, and a
# masked token is still a disclosure.

.PHONY: gh-auth
gh-auth: ## Check gh is authenticated as the account that owns this repository
	@$(SAY) "gh authentication"
	@if ! command -v gh >/dev/null 2>&1; then \
	  printf "  %-14s $(RED)%s$(RESET)\n" "gh" "not installed"; \
	  $(WARN) "these targets run inside the dev container - reopen the repo in it"; exit 1; fi
	@printf "  %-14s %s\n" "gh" "$$(gh --version | head -1)"
	@if [ -z "$${GH_TOKEN:-}" ]; then \
	  printf "  %-14s $(YELLOW)%s$(RESET)\n" "GH_TOKEN" "unset or empty"; \
	  printf "  %-14s %s\n" "" "the container reads it from HOMELABCENTRAL_GH_TOKEN on the host"; \
	  printf "  %-14s %s\n" "" "exported from the VSCODE_RESOLVING_ENVIRONMENT guard in ~/.zshrc"; \
	  printf "  %-14s %s\n" "" "if that export exists: quit VS Code fully and relaunch - Reload"; \
	  printf "  %-14s %s\n" "" "Window and Rebuild Container both reuse the cached shell env"; \
	else \
	  printf "  %-14s $(GREEN)%s$(RESET)\n" "GH_TOKEN" "present"; \
	fi
	@login=""; \
	 if out="$$(gh api user --jq .login 2>/dev/null)"; then login="$$(printf '%s' "$$out" | head -1)"; fi; \
	 case "$$login" in *[!A-Za-z0-9-]*) login="" ;; esac; \
	 if [ -z "$$login" ]; then \
	   printf "  %-14s $(RED)%s$(RESET)\n" "identity" "not authenticated"; \
	   if [ -n "$${GH_TOKEN:-}" ]; then \
	     $(WARN) "GH_TOKEN is set but GitHub rejected it - expired or revoked"; \
	     $(WARN) "after rotating it the container still holds the old value until"; \
	     $(WARN) "VS Code is fully quit and relaunched"; \
	   else \
	     $(WARN) "no credential at all - see GH_TOKEN above"; \
	   fi; \
	   exit 1; \
	 elif [ "$$login" != "$(GH_OWNER)" ]; then \
	   printf "  %-14s $(RED)%s$(RESET)\n" "identity" "$$login"; \
	   $(WARN) "this repository belongs to $(GH_OWNER) - $$login is not a collaborator"; \
	   $(WARN) "gh pr create would fail with 'must be a collaborator'"; \
	   $(WARN) "run make inside the dev container - the host gh is a different account"; \
	   exit 1; \
	 else \
	   printf "  %-14s $(GREEN)%s$(RESET)\n" "identity" "$$login"; \
	 fi
	@$(OK) "gh can write to $(GH_OWNER)"

.PHONY: git-auth
git-auth: ## Check git identity and that origin is reachable for pushing
	@$(SAY) "git authentication"
	@printf "  %-14s %s\n" "user.name" "$$(git config user.name || echo '(unset)')"
	@printf "  %-14s %s\n" "user.email" "$$(git config user.email || echo '(unset)')"
	@if [ -z "$$(git config user.name)" ] || [ -z "$$(git config user.email)" ]; then \
	  $(WARN) "this repo is owned by a different account than the host default -"; \
	  $(WARN) "set them repo-locally rather than relying on the global config"; \
	fi
	@url="$$(git remote get-url origin 2>/dev/null || true)"; \
	 if [ -z "$$url" ]; then printf "  %-14s $(RED)%s$(RESET)\n" "origin" "no remote"; exit 1; fi; \
	 printf "  %-14s %s\n" "origin" "$$url"; \
	 case "$$url" in \
	   git@github-homelabcentral:*) ;; \
	   git@github.com:*) $(WARN) "plain github.com selects the host's default key - this repo" ; \
	                     $(WARN) "needs the github-homelabcentral ssh alias" ;; \
	 esac
	@if [ -n "$${SSH_AUTH_SOCK:-}" ] && [ -S "$${SSH_AUTH_SOCK:-}" ]; then \
	   printf "  %-14s $(GREEN)%s$(RESET)\n" "ssh-agent" "forwarded"; \
	 else \
	   printf "  %-14s $(YELLOW)%s$(RESET)\n" "ssh-agent" "not forwarded"; \
	   printf "  %-14s %s\n" "" "VS Code forwards it to terminals it opens; a plain"; \
	   printf "  %-14s %s\n" "" "'docker exec' does not - push from a VS Code terminal"; \
	 fi
	@if git ls-remote --exit-code --heads origin >/dev/null 2>&1; then \
	   printf "  %-14s $(GREEN)%s$(RESET)\n" "push access" "origin reachable"; \
	   $(OK) "git can push to origin"; \
	 else \
	   printf "  %-14s $(RED)%s$(RESET)\n" "push access" "origin unreachable"; \
	   $(WARN) "the host keys are mounted read-only and the agent does the signing"; \
	   $(WARN) "so this usually means the agent is missing rather than a bad key"; \
	   exit 1; \
	 fi

.PHONY: pr
pr: gh-auth ## Open a PR for the current branch: make pr TITLE="..." [BODY_FILE=f] [DRAFT=1] [YES=1]
	@if [ -z "$(TITLE)" ]; then \
	  $(ERR) 'TITLE required, e.g. make pr TITLE="post: rack cooling"'; exit 1; fi
	@branch="$$(git rev-parse --abbrev-ref HEAD)"; \
	 if [ "$$branch" = "$(BASE)" ]; then \
	   $(ERR) "on $(BASE) - branch first, then open the PR"; exit 1; fi; \
	 if ! git rev-parse --verify --quiet "refs/remotes/origin/$$branch" >/dev/null; then \
	   $(ERR) "$$branch has never been pushed - git push -u origin $$branch"; exit 1; fi; \
	 ahead="$$(git rev-list --count "refs/remotes/origin/$$branch..HEAD")"; \
	 if [ "$$ahead" != "0" ]; then \
	   $(ERR) "$$ahead local commit(s) not on origin - push before opening the PR"; exit 1; fi; \
	 if [ -n "$$(gh pr list --head "$$branch" --state open --json number --jq '.[].number')" ]; then \
	   $(ERR) "a PR is already open for $$branch - push to it instead"; exit 1; fi
	$(call CONFIRM,Open a pull request from $$(git rev-parse --abbrev-ref HEAD) into $(BASE)?)
	@$(SAY) "Opening the pull request"
	@gh pr create --base "$(BASE)" --head "$$(git rev-parse --abbrev-ref HEAD)" \
	  --title "$(TITLE)" \
	  $(if $(BODY_FILE),--body-file "$(BODY_FILE)",$(if $(BODY),--body "$(BODY)",--fill)) \
	  $(if $(DRAFT),--draft,)
	@$(OK) "opened - make pr-checks to watch the Build site gate"

.PHONY: pr-close
pr-close: gh-auth ## Close a PR without merging: make pr-close [PR=3] [DELETE_BRANCH=1] [YES=1]
	@num="$(PR)"; [ -n "$$num" ] || num="$$(gh pr view --json number --jq .number 2>/dev/null)"; \
	 if [ -z "$$num" ]; then $(ERR) "no open PR for this branch - pass PR=<number>"; exit 1; fi; \
	 $(SAY) "$$(gh pr view "$$num" --json number,title,headRefName \
	   --jq '"#\(.number) \(.title)  [\(.headRefName)]"')"
	$(call CONFIRM,Close this pull request without merging?)
	@num="$(PR)"; [ -n "$$num" ] || num="$$(gh pr view --json number --jq .number)"; \
	 gh pr close "$$num" $(if $(DELETE_BRANCH),--delete-branch,); \
	 $(OK) "closed #$$num"

.PHONY: pr-list
pr-list: gh-auth ## List open pull requests
	@gh pr list --state open

.PHONY: pr-view
pr-view: gh-auth ## Show a PR: make pr-view [PR=3]
	@gh pr view $(PR)

.PHONY: pr-checks
pr-checks: gh-auth ## Watch a PR's checks to completion: make pr-checks [PR=3]
	@gh pr checks $(PR) --watch

##@ Remote CI (GitHub Actions)

# Two workflows. build-check.yml is the gate: it runs on every pull_request
# against main and on every push to a branch that is not main, building the
# merge result rather than the branch tip. pages.yml runs on a push to main and
# is the publish.
#
# BRANCH defaults to the checked-out branch and takes any ref name, so main's
# runs are visible without checking main out. STATUS filters by gh's own run
# states - queued, in_progress, completed, failure, success - and LIMIT sets how
# many rows `gh-runs` prints.
GH_BRANCH = $(if $(BRANCH),$(BRANCH),$$(git rev-parse --abbrev-ref HEAD))
GH_LATEST = gh run list --branch "$(GH_BRANCH)" --limit 1 --json databaseId --jq '.[0].databaseId'

.PHONY: gh-runs
gh-runs: gh-auth ## List recent Actions runs: make gh-runs [BRANCH=main] [STATUS=in_progress] [LIMIT=10]
	@gh run list --branch "$(GH_BRANCH)" --limit $(if $(LIMIT),$(LIMIT),10) \
	  $(if $(STATUS),--status "$(STATUS)",)

.PHONY: gh-watch
gh-watch: gh-auth ## Watch the latest Actions run: make gh-watch [BRANCH=main]
	@id="$$($(GH_LATEST))"; \
	 if [ -z "$$id" ]; then $(ERR) "no runs for $(GH_BRANCH) yet"; exit 1; fi; \
	 gh run watch "$$id"

.PHONY: gh-rerun
gh-rerun: gh-auth ## Re-run failed jobs of the latest run: make gh-rerun [BRANCH=main] [YES=1]
	@id="$$($(GH_LATEST))"; \
	 if [ -z "$$id" ]; then $(ERR) "no runs for $(GH_BRANCH) yet"; exit 1; fi; \
	 $(SAY) "latest run on $(GH_BRANCH): $$id"
	$(call CONFIRM,Re-run the failed jobs of that run?)
	@gh run rerun "$$($(GH_LATEST))" --failed
	@$(OK) "re-run queued - make gh-watch to follow it"

.PHONY: gh-dispatch
gh-dispatch: gh-auth ## Trigger pages.yml by hand: make gh-dispatch [REF=main] [YES=1]
	@$(WARN) "pages.yml is the publish - it force-pushes public/ to the .github.io repo"
	@$(WARN) "and that repo is rewritten to a single commit on every publish"
	$(call CONFIRM,Really publish $(if $(REF),$(REF),main) to the live site?)
	@gh workflow run pages.yml --ref "$(if $(REF),$(REF),main)"
	@$(OK) "dispatched - make gh-watch BRANCH=$(if $(REF),$(REF),main) to follow it"
