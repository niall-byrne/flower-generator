#!/bin/bash

set -eo pipefail

main() {
  BRANCH_OR_TAG="$(echo "${GITHUB_REF}" | sed 's/refs\/heads\///g' | sed 's/refs\/tags\///g')"
  WORKFLOW_URL="$GITHUB_SERVER_URL/$GITHUB_REPOSITORY/actions/runs/$GITHUB_RUN_ID"

  {
    echo "BRANCH_OR_TAG=${BRANCH_OR_TAG}"
    echo "WEBHOOK_URL=${WEBHOOK_URL}"
    echo "NOTIFICATION=${PROJECT_NAME} [<${WORKFLOW_URL}|${BRANCH_OR_TAG}>]"
  } >> "$GITHUB_ENV"

}

main
