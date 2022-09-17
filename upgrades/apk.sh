#!/usr/bin/env bash
set -euo pipefail

apk upgrade

echo OK > /var/spool/adyxax/nagios/upgrade
