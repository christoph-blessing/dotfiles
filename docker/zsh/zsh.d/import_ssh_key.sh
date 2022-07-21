eval "$(ssh-agent)"
echo "${SSH_PRIVATE_KEY}" > /tmp/id_rsa
trap "rm -f /tmp/id_rsa" EXIT
chmod 600 /tmp/id_rsa
ssh-keygen -p -f /tmp/id_rsa -P "${SSH_PASSPHRASE}" -N ""
ssh-add /tmp/id_rsa
