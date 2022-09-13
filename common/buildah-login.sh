#!/usr/bin/env bash
set -euo pipefail

LOGIN=`cat $EVENTLINE_DIR/identities/quay-io/login`
PASSWORD=`cat $EVENTLINE_DIR/identities/quay-io/password`

buildah login -u "${LOGIN}" -p "${PASSWORD}" quay.io
