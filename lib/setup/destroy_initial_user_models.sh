#!/usr/bin/env bash -x
set -x
bin/rails destroy model GithubAccount
bin/rails destroy model Supporter
bin/rails destroy model Creator
bin/rails destroy model Tier
bin/rails destroy model Sponsorship
set +x
