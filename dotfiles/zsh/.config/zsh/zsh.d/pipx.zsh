if [ -x "$(whence -p pipx)" ]; then
    eval "$(register-python-argcomplete pipx)"
fi
