#!/usr/bin/env bash
set -eux

# This script uses gpg + pass to retrieve the key to PBS store.
# It assumes that the PBS API KEY is named "pbs-api-key"
# https://coderden.dev/posts/how-to-securely-store-passwords-with-gpg-pass
PBS_PASSWORD_CMD="pass pbs-password" \
  proxmox-backup-client login

proxmox-backup-client backup \
  --change-detection-mode=metadata \
  pve-etc.pxar:/etc \
  --include-dev /etc/pve pve-root.pxar:/root
