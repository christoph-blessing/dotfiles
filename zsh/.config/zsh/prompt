# Get name of current git branch
function git_branch_name {
    branch=$(git symbolic-ref HEAD 2> /dev/null | awk 'BEGIN{FS="/"} {print $NF}')
    if [[ $branch == "" ]]; then
        :
    else
        echo ' %{\x1b[38;2;235;219;178m%}on%{\x1b[0m%} %{\x1b[38;2;211;134;155m%}'$branch'%{\x1b[0m%}'
    fi
}

# Get current vim mode
function vim_mode {
    case ${KEYMAP} in
        (vicmd) echo '%{\x1b[38;2;184;187;38m%}$%{\x1b[0m%}' ;;
        (*) echo '%{\x1b[38;2;131;165;152m%}>%{\x1b[0m%}' ;;
    esac
}

# Set prompt
setopt PROMPT_SUBST
PROMPT=$'%{\x1b[38;2;251;73;52m%}%n@%m%{\x1b[0m%} %{\x1b[38;2;235;219;178m%}in%{\x1b[0m%} %{\x1b[38;2;250;198;47m%}%1~%{\x1b[0m%}$(git_branch_name) $(vim_mode) '
