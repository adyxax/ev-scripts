#!/usr/bin/env bash
set -euo pipefail

CRT="${EVENTLINE_DIR}/identities/adyxax-org-fullchain/password"
KEY="${EVENTLINE_DIR}/identities/adyxax-org-key/password"
SSHKEY="${EVENTLINE_DIR}/identities/ssh/private_key"

SSHOPTS="-i ${SSHKEY} -o StrictHostKeyChecking=accept-new"

scp ${SSHOPTS} "${KEY}" root@yen.adyxax.org:/etc/nginx/adyxax.org.key
scp ${SSHOPTS} "${CRT}" root@yen.adyxax.org:/etc/nginx/adyxax.org-fullchain.cer
scp ${SSHOPTS} "${KEY}" root@yen.adyxax.org:/var/imap/yen.adyxax.org.key
scp ${SSHOPTS} "${CRT}" root@yen.adyxax.org:/etc/ssl/yen.adyxax.org.crt
#scp 'adyxax.org.key' root@myth.adyxax.org:/etc/smtpd/adyxax.org.key
#scp 'adyxax.org.crt' root@myth.adyxax.org:/etc/smtpd/fullchain.cer
ssh ${SSHOPTS} root@yen.adyxax.org rcctl restart cyrus_imapd
ssh ${SSHOPTS} root@yen.adyxax.org rcctl restart nginx

#cp 'adyxax.org.crt' ~/git/adyxax/ansible/files/adyxax.org.fullchain
#cp 'adyxax.org.key'  ~/git/adyxax/ansible/files/adyxax.org.key
# TODO ansible make run
scp ${SSHOPTS} "${KEY}" root@lore.adyxax.org:/usr/local/etc/nginx/adyxax.org.key
scp ${SSHOPTS} "${CRT}" root@lore.adyxax.org:/usr/local/etc/nginx/adyxax.org.fullchain
ssh ${SSHOPTS} root@lore.adyxax.org service nginx reload
scp ${SSHOPTS} "${KEY}" root@kaladin.adyxax.org:/usr/local/etc/nginx/adyxax.org.key
scp ${SSHOPTS} "${CRT}" root@kaladin.adyxax.org:/usr/local/etc/nginx/adyxax.org.fullchain
ssh ${SSHOPTS} root@kaladin.adyxax.org service nginx reload
scp ${SSHOPTS} "${KEY}" root@kaladin.adyxax.org:/usr/local/etc/adyxax.org.key
scp ${SSHOPTS} "${CRT}" root@kaladin.adyxax.org:/usr/local/etc/adyxax.org.fullchain
#ssh -o StrictHostKeyChecking=no root@kaladin.adyxax.org service ngircd restart
# TODO reload nginx, restart ngircd
