.PHONY: serve draft build clean new-post new-talk help

HUGO := hugo
PUBLIC_DIR := public
PORT := 1313

help: ## Show this help
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "  \033[36m%-15s\033[0m %s\n", $$1, $$2}'

serve: ## Run dev server (published content only)
	$(HUGO) server --port $(PORT)

draft: ## Run dev server including draft content
	$(HUGO) server --buildDrafts --port $(PORT)

build: clean ## Build production site
	$(HUGO) --minify

preview: clean ## Build site including drafts (for previewing before publish)
	$(HUGO) --buildDrafts --minify

clean: ## Remove generated site
	rm -rf $(PUBLIC_DIR)

new-post: ## Create a new blog post (usage: make new-post TITLE="my-post-slug")
	@test -n "$(TITLE)" || (echo "Usage: make new-post TITLE=\"my-post-slug\"" && exit 1)
	$(HUGO) new content blog/$(TITLE).md

new-talk: ## Create a new talk entry (usage: make new-talk TITLE="my-talk-slug")
	@test -n "$(TITLE)" || (echo "Usage: make new-talk TITLE=\"my-talk-slug\"" && exit 1)
	$(HUGO) new content talks/$(TITLE).md
