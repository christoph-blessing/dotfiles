# If tmux is executable, X is running, and not inside a tmux session, then try to attach.
# If attachment fails, start a new session
if [ -x "$(command -v tmux)" ] && [ -n "${DISPLAY}" ]; then
  [ -z "${TMUX}" ] && (tmux attach || tmux) >/dev/null 2>&1
fi

