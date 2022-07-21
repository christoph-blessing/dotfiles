echo "$GPG_PRIVATE_KEY" | gpg --batch --import
echo "$GPG_PASSPHRASE" | /usr/lib/gnupg/gpg-preset-passphrase --preset "$GPG_KEYGRIP"
