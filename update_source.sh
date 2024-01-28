#!/bin/bash

set -e

PROJECT_DIR=$(pwd)

function error() {

    cd "$PROJECT_DIR"
    exit 0
}


git submodule init

cd kernel/kernel-5.10   
if [ -z "$1" ]; then
    echo "Please provide the branch which you want to checkout, possiblities are"
    git branch
    error
fi

if git show-ref --quiet refs/heads/$1; then
    BRANCH=$1
else
    echo "Branch: $1 does not exist"
    error
fi
cd "$PROJECT_DIR"

git submodule udate
git submodule foreach 'git checkout $BRANCH'

cd kernel/nvidia/drivers/net/ethernet/nvidia/nvethernet
git submodule init
git submodule update
cd nvethernetrm
git checkout $BRANCH

cd "$PROJECT_DIR"

exit 0

