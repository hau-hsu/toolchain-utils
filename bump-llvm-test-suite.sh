#!/usr/bin/env bash

# sync main with upstream
git clone git@github.com:sifive/llvm-test-suite.git
cd llvm-test-suite
git checkout main
git remote add upstream git@github.com:llvm/llvm-test-suite.git
git pull upstream main  #should be able to fast forward
git push

# merge sifive-dev to main
git checkout sifive-dev
git merge main --no-edit
git push

# trigger test-driver bumpper
https://jenkins.internal.sifive.com/job/toolchain-utils/job/bump-toolchain-test-driver-projects/build?token=bumptoolchaintestdriver
