#!/bin/bash

set -e
# set -u

function gitflow
{
    TAG=$1
    # 检测参数是否存在
    if [ ! -n "$TAG" ]; then
        echo "\033[1;31m" "请输入tag号作为参数" "\033[0m"
        exit 1
    fi


    set -x

        git checkout develop
        git checkout -b release/$TAG
        git checkout release/$TAG
        git merge --no-ff master -m "merge master to release/$TAG"
        git tag -a $TAG -m "release/$TAG"
        git checkout master
        git merge --no-ff release/$TAG -m "merge release/$TAG to master"
        git checkout develop
        git merge --no-ff release/$TAG -m "merge release/$TAG to develop"
        git branch -d release/$TAG

    set +x
}

gitflow $1
echo "\033[1;32m" "请手动执行:" "\033[0m"
echo "\033[1;32m" "  git push origin master --tags" "\033[0m"
echo "\033[1;32m" "  git push origin develop" "\033[0m"