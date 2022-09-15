# ev-scripts: various scripts used on my infrastructure

This repository contains code for scripts and [eventline](https://www.exograd.com/products/eventline/) jobs using those scripts.

See [my blog article on eventline](https://www.adyxax.org/blog/2022/09/03/testing-eventline/) for my motivations in gathering scripts from all around my infrastructure and putting those here.

## Contents

- [eventline](#eventline)
- [mirror-to-github](#mirror-to-github)
- [www](#www)

## eventline

This folder contains a "meta" job to sync these eventline jobs to eventline. It is triggered by a gitolite hook that looks like the following:
```sh
#!/usr/bin/env bash
set -euo pipefail

BLUE="\e[34m"
RESET="\e[0m"

read -r oldrev newrev refname

if [[ "${refname}" = "refs/heads/master" ]]; then
       printf "${BLUE}Deploying with a call to eventline...${RESET}\n"
       ret=0
       evcli execute-job --wait --fail ev-scripts-deploy || exit $?
else
       printf "${BLUE}Not deploying since ref is ${refname} and not refs/heads/master${RESET}\n"
fi
```

It could easily be triggered by github push events instead, but I do not want my personal infrastructure to rely on it.

## mirror-to-github

This folder contains a job to mirror one of my public repositories to github. It is triggered by the following gitolite hook:
```sh
#!/usr/bin/env bash
set -euo pipefail

BLUE="\e[34m"
RESET="\e[0m"

read -r oldrev newrev refname

printf "${BLUE}Mirroring to github with eventline...${RESET}\n"
evcli execute-job --wait --fail mirror-to-github "repo=${GL_REPO}" || exit $?
```

## www

### www-build

The first job in the www folder builds and push the container images of my personal website and is triggered by the following gitolite hook:
```sh
#!/usr/bin/env bash
set -euo pipefail

BLUE="\e[34m"
BLUE="\e[34m"
GREEN="\e[32m"
RESET="\e[0m"

read -r oldrev newrev refname

if [[ "${refname}" = "refs/heads/master" ]]; then
|       printf "${BLUE}Building with eventline...${RESET}\n"
|       ret=0
|       evcli execute-job --wait --fail www-build || exit $?
|       printf "${GREEN}You can deploy with 'evcli execute-job --wait --fail www-deploy'${RESET}\n"
else
|       printf "${BLUE}Not building since ref is ${refname} and not refs/heads/master${RESET}\n"
fi
```

### www-deploy

The second job deploys the previously built images to my kubernetes server and is triggered manually.
