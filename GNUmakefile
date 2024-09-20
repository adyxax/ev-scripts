SHELL:=bash

.PHONY: check
check: ## make check  # Check syntax of eventline jobs
	evcli deploy-jobs --dry-run \
              certificates/*.yaml \
              grenade-brothers/*.yaml \
              mirror-to-github/*.yaml \
	      ods/*.yaml \
              www/*.yaml
	evcli deploy-jobs --dry-run -p upgrades \
	      upgrades/*.yaml

.PHONY: run
run: ## make run    # deploy all jobs
	evcli deploy-jobs \
              certificates/*.yaml \
	      grenade-brothers/*.yaml \
	      mirror-to-github/*.yaml \
	      ods/*.yaml \
	      www/*.yaml
	evcli deploy-jobs -p upgrades \
	      upgrades/*.yaml

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

.DEFAULT_GOAL := help
