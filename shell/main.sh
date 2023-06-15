#!/bin/bash

# 报错即停止
set -e
# 遇到不存在的变量即停止
set -u

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

gitflow


# git flow 模式打tag
# 0. 切到develop分支
# git checkout develop
# 1. 从 develop 分支切出一个 release 分支
# git checkout -b release/
# 2. 在 release 分支上修改版本号

# 3. 合并 release 分支到 master 分支
# 4. 在 master 分支上打 tag
# 5. 合并 master 分支到 develop 分支
# 6. 删除 release 分支
# 7. 推送 master 分支和 tag 到远程仓库
# 8. 推送 develop 分支到远程仓库
