#!/usr/bin/zsh

if [ -z "${GPG_PRIVATE_KEY}" ]; then 
  echo "GPG_PRIVATE_KEY is not set"
  exit
fi
if [ -z "${GPG_PASSPHRASE}" ]; then
  echo "GPG_PASSPHRASE is not set"
  exit
fi
if [ -z "${GPG_KEYGRIP}" ]; then
  echo "GPG_KEYGRIP is not set"
  exit
fi

echo "$GPG_PRIVATE_KEY" | gpg --batch --import
echo "$GPG_PASSPHRASE" | /usr/lib/gnupg/gpg-preset-passphrase --preset "$GPG_KEYGRIP"
