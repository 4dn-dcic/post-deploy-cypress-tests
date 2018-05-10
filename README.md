# Cypress Post-Deployment Tests

Tests are meant to be ran post-deployment via a Travis virtual machine (which pre-installs browser and other necessities).

Currently, is meant to run Cypress tests (defined [here](https://github.com/4dn-dcic/fourfront/tree/selenium/deploy/post_deploy_testing/cypress/integration)). Some tests import older 'local' / 'deployment' tests from the root cypress directory, but this is deprecated.

## Triggering a Post-Deploy Test

- Go to https://travis-ci.org/4dn-dcic/post-deploy-cypress-tests
- Ensure are logged in.
- In the drop-down menu at top right, click "Trigger Custom Build"
- Select branch to run on, which corresponds to domain name tested against (staging or data environment)
- Fill in any random message for "Commit Message", leave "Configuration" box blank.
- Press "Trigger", and wait for tests to run and related videos, screenshots, and reports to be displayed on the  [Cypress Dashboard](https://dashboard.cypress.io/#/projects/4opx2c/runs)

## Tasks for the Future

- To make merging simpler, get rid of having a differing `config.sh` file in each branch, and instead, have a **common** config YAML file (or similar) between all branches which define different domain/test-config per branch in a dictionary. For example:
    ```yaml
    branch_configurations:
        staging.4dnucleome.org:
            baseUrl: http://staging.4dnucleome.org
            fourfront_branch: master
            ....
        data.4dnucleome.org:
            baseUrl: https://data.4dnucleome.org
            fourfront_branch: master
            ....
        fourfront-hotseat:
            baseUrl: http://fourfront-hotseat.9wzadzju3p.us-east-1.elasticbeanstalk.com/
            fourfront_branch: some_indevelopment_branch
            ....
        
    ```
- Perhaps a "master" or more semantically, a "common" branch should be used which is used for editing and then always pulled into domain-specific branches. **N.B.** Existence of multiple branches is simply for simplicity of triggering from Travis.
- Migrate Cypress test definitions to this repository as Cypress no longer needs to be installed in NPM along with other fourfront JS libraries (unless maybe running tests locally) in fourfront repo.
