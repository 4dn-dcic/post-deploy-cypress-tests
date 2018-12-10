#!/bin/bash

CURRENT_POSTDEPLOY_BRANCH=$(git rev-parse --abbrev-ref HEAD)   # Get current branch

if [ $CURRENT_POSTDEPLOY_BRANCH == "staging.4dnucleome.org" ]; then
    export FOURFRONT_REPO="https://github.com/4dn-dcic/fourfront.git"
    export FOURFRONT_BRANCH="master"
    export CYPRESS_BASE_URL="http://staging.4dnucleome.org/"
fi

if [ $CURRENT_POSTDEPLOY_BRANCH == "data.4dnucleome.org" ]; then
    export FOURFRONT_REPO="https://github.com/4dn-dcic/fourfront.git"
    export FOURFRONT_BRANCH="master"
    export CYPRESS_BASE_URL="https://data.4dnucleome.org/"
fi

if [ $CURRENT_POSTDEPLOY_BRANCH == "fourfront-hotseat" ]; then
    export FOURFRONT_REPO="https://github.com/4dn-dcic/fourfront.git"
    export FOURFRONT_BRANCH="master"
    export CYPRESS_BASE_URL="http://fourfront-hotseat.9wzadzju3p.us-east-1.elasticbeanstalk.com/"
fi

