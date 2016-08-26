#!/bin/sh

gitrepo=https://github.com/stackfeed/ci-scripts.git
usage=`cat <<EHD

Usage: $0 [-r gitref] [directory]

    Installs CI helper scripts from github.com/stackfeed/ci-scripts
    into directory (default ~/ci-scripts).
EHD`

# Parse options
while getopts "r:h" opt; do
    case $opt in
        r)
            gitref=$OPTARG
            ;;
        h)
            echo "${usage}"; exit 0;
            ;;
        \?)
            error=yes
            ;;
    esac
done

# Abort on error
[ -n "$error" ] && { echo "${usage}"; exit 1; }

# ==== DEFAULTS ====
#
shift $((OPTIND-1))
directory=${1:-~/ci-scripts}
gitref=${gitref:-master}

# Don't overwrite
[ -d $directory ] && { >&2 echo "==> Can't clone to an existing directory \`$directory'"; exit 1; }

# Create directory and shallow fetch the remote
mkdir -p $directory && cd $directory

git init && git remote add origin $gitrepo
git fetch --depth 1 origin $gitref && git reset --hard FETCH_HEAD
