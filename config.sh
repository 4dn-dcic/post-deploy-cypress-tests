#!/bin/bash

# Get current branch
if [ -z $TRAVIS_BRANCH ]; then
    # Not on Travis - grab from git command(s)
    CURRENT_POSTDEPLOY_BRANCH=$(git branch | grep \* | cut -d ' ' -f2);
else
    # On Travis - grab from Travis env variable
    CURRENT_POSTDEPLOY_BRANCH=$(if [ "$TRAVIS_PULL_REQUEST" == "false" ]; then echo $TRAVIS_BRANCH; else echo $TRAVIS_PULL_REQUEST_BRANCH; fi)
fi

echo "Post deploy testing branch is \"$CURRENT_POSTDEPLOY_BRANCH\""

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
    export FOURFRONT_BRANCH="frontend-edits-2"
    export CYPRESS_BASE_URL="http://fourfront-hotseat.9wzadzju3p.us-east-1.elasticbeanstalk.com/"
fi

echo "Base URL used is \"$CYPRESS_BASE_URL\""

