#!/usr/bin/env bash
set -euo pipefail

pkg upgrade -y

echo OK > /var/spool/adyxax/nagios/upgrade
