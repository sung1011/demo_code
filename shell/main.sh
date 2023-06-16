#!/bin/bash

set -e
# set -u

function gitflow
{
    TAG=$1
    if [ ! -n "$TAG" ]; then
        echo "\033[1;31m" "请输入tag号作为参数" "\033[0m"
        exit 1
    fi


    set -x

        git checkout develop
        git checkout -b release/$TAG
        git checkout release/$TAG

        git checkout develop
        git merge --no-ff release/$TAG -m "merge release/$TAG to develop"

        git checkout master
        git merge --no-ff release/$TAG -m "merge release/$TAG to master"
        git tag -a $TAG -m "release/$TAG"

        git branch -d release/$TAG
}

gitflow $1
echo "\033[1;32m" "完成! 请手动执行:" "\033[0m"
echo "\033[1;32m" "  git push origin tag $1" "\033[0m"
echo "\033[1;32m" "  git push origin master" "\033[0m"
echo "\033[1;32m" "  git push origin develop" "\033[0m"