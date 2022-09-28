#!/bin/bash
set -e

# Then exec the container's main process (what's set as CMD in the Dockerfile).

bundle exec rake db:migrate 2>/dev/null || bundle exec rake db:setup


exec "$@"
