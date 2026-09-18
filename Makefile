# homelabcentral.net
#
# One server, one port. Hugo serves on 8043 - that is the only port the dev
# container forwards. Nothing serves `public/`; it is a build artifact, written
# by whichever of these ran last. `make prod` is the one that writes it the way
# CI does, so re-run that before trusting what is in there.
#
#   make dev       authoring: live reload, drafts and future posts
#   make preview   what ships: production environment, minified, no drafts
#   make prod      writes public/ exactly as the Pages workflow does

.DEFAULT_GOAL := help
PORT ?= 8043

# The site's production base URL, used by `prod` and `preview`. Overridable:
# `make prod BASE_URL=https://staging.example.com/`. Keep the trailing slash -
# Hugo joins paths onto it directly. This must stay in step with `baseURL` in
# hugo.yaml and with the --baseURL in .github/workflows/pages.yml.
BASE_URL ?= https://homelabcentral.net/

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

.PHONY: help dev preview build prod clean theme-update

help: ## Show this help
	@grep -hE '^[a-zA-Z_-]+:.*?## ' $(MAKEFILE_LIST) \
	  | awk 'BEGIN {FS = ":.*?## "}; {printf "  \033[36m%-14s\033[0m %s\n", $$1, $$2}'

dev: ## Serve on :8043 with live reload, drafts and future posts
	hugo server --disableFastRender -D -F --port $(PORT) --bind 0.0.0.0

# --appendPort=false is required for the baseURL to stay clean; without it the
# server advertises the base URL with the port glued on. The cost is LiveReload:
# Hugo builds the injected websocket URL from the baseURL, so stripping the port
# leaves it empty and auto-refresh stops working. Acceptable here and not on
# `dev` - this target is for inspecting output, not for editing against.
preview: ## Serve on :8043 as production: real baseURL, minified, no drafts
	hugo server --environment production --minify \
	  --baseURL "$(BASE_URL)" --appendPort=false \
	  --port $(PORT) --bind 0.0.0.0

build: ## Write public/ (add CLEAN=1 to prune files this build did not produce)
	hugo --gc --minify $(CLEAN_DEST)

prod: ## Write public/ as CI does, at $(BASE_URL) (add CLEAN=1 to prune)
	hugo --gc --minify $(CLEAN_DEST) --baseURL "$(BASE_URL)"

clean: ## Remove build output
	rm -rf public resources .hugo_build.lock

# Reads the pinned version out of go.mod by scanning fields rather than a
# fixed column, so it works with both the single-line `require` form and a
# `require (...)` block. `hugo mod get -u` itself only speaks up when it
# changes something - a no-op upgrade is silent, which reads the same as a
# failure. Comparing before and after makes "already current" explicit.
THEME := github.com/homelabcentral/hextra
theme_version = $(shell awk '{for (i = 1; i <= NF; i++) if ($$i == "$(THEME)") print $$(i + 1)}' go.mod)

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
