#!/bin/bash -e

# This changes the protocol for a .git/config
# from https to ssh

__validate_git_config(){
    local FILE_PATH
    FILE_PATH=$1

    if ! [[ "$FILE_PATH" =~ \.git\/.*config$ ]]
    then
        echo "File provided ($FILE_PATH) is not a valid git config"
        return 1
    fi
    return 0
}

__change_git_protocol(){
    local FILE_PATH OVERWRITE
    for FILE_PATH in "$@"
    do
        if ! __validate_git_config "$FILE_PATH"; then
            continue
        fi

        # if 'git@github.com:' is found means it is already using ssh
        grep -q "git@github.com:" "$FILE_PATH" && return 0

        case "$(uname -s)" in
            [Dd]arwin) OVERWRITE='-i ""' ;;
            *)         OVERWRITE='-i'
        esac

        eval "sed $OVERWRITE -e 's#https://#git@#' -e 's#.com/#.com:#' \"$FILE_PATH\""
        echo "Protocol changed from 'http' to 'ssh' for: $FILE_PATH"
    done
}

# If this file is running in terminal call the function `__change_git_protocol`
# Otherwise just source it
if [ "$(basename "${0}")" = "change-git-protocol.sh" ]
then
  __change_git_protocol "${@}"
fi
