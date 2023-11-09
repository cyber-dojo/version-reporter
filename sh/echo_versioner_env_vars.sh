#!/usr/bin/env bash
set -Eeu

# - - - - - - - - - - - - - - - - - - - - - - - -
echo_versioner_env_vars()
{
  docker run --rm cyberdojo/versioner:latest
  #
  echo CYBER_DOJO_VERSION_REPORTER_SHA="$(git_commit_sha)"
  echo CYBER_DOJO_VERSION_REPORTER_TAG="$(git_commit_tag)"
  #
  echo CYBER_DOJO_VERSION_REPORTER_CLIENT_IMAGE=cyberdojo/version-reporter-client
  echo CYBER_DOJO_VERSION_REPORTER_CLIENT_PORT=9999
  #
  echo CYBER_DOJO_VERSION_REPORTER_CLIENT_USER=nobody
  echo CYBER_DOJO_VERSION_REPORTER_SERVER_USER=nobody
  #
  echo CYBER_DOJO_VERSION_REPORTER_CLIENT_CONTAINER_NAME=test_version_reporter_client
  echo CYBER_DOJO_VERSION_REPORTER_SERVER_CONTAINER_NAME=test_version_reporter_server
}

# - - - - - - - - - - - - - - - - - - - - - - - -
git_commit_sha()
{
  git rev-parse HEAD
}

# - - - - - - - - - - - - - - - - - - - - - - - -
git_commit_tag()
{
  sha="$(git_commit_sha)"
  echo "${sha:0:7}"
}

# - - - - - - - - - - - - - - - - - - - - - - - -
image_name()
{
  echo "${CYBER_DOJO_VERSION_REPORTER_IMAGE}"
}

# - - - - - - - - - - - - - - - - - - - - - - - -
image_sha()
{
  docker run --rm $(image_name) sh -c 'echo ${SHA}'
}
