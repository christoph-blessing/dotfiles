# Prepend __pypackages__/**/bin to PATH if present in current working directory or one of its ancestors
RAW_PATH=$PATH
LAST_WD=`pwd`
augment_path() {
    setopt nullglob
    target="__pypackages__/**/bin"
    if [ "$PWD" = "$LAST_WD" ]; then return 0; fi;
    path_addition=""
    scandir=$PWD
    until [ "$scandir" = "" ]; do
        resolved_target=($scandir/$~target)
        if [ ${#resolved_target[@]} != 0 ]; then
                path_addition=${resolved_target:0:1}:$path_addition
        fi
        scandir=${scandir%/*}
    done
    PATH=$path_addition:$RAW_PATH
    LAST_WD=`pwd`
    unsetopt nullglob
}

precmd() augment_path
