#!/bin/bash
#
# scripts/github-release-varables.sh
#
export GIT_ACCOUNT=cjsteel
export GIT_SHORT_NAME=pip
export GIT_REPOSITORY=ansible-role-$GIT_SHORT_NAME
export GIT_TAG="`cat VERSION`"
