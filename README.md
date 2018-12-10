# Cypress Post-Deployment Tests

'Post Deploy' Cypress tests from the [fourfront repository](https://github.com/4dn-dcic/fourfront/tree/master/deploy/post_deploy_testing) are imported and ran by code in this repository on the Travis Continuous Integration VM(s) (which pre-installs browser and other necessities). These tests are ran _after_ deployment to a **production** or **staging** environment and thus any edits created by tests must be cleaned up afterward.

## How to trigger a Post-Deploy Test

- Go to https://travis-ci.org/4dn-dcic/post-deploy-cypress-tests
- Ensure are logged in.
- In the drop-down menu at top right, click "Trigger Custom Build"
- Select branch to run on, which corresponds to domain name tested against (staging or data environment)
- Fill in any random message for "Commit Message", leave "Configuration" box blank.
- Press "Trigger", and wait for tests to run and related videos, screenshots, and reports to be displayed on the  [Cypress Dashboard](https://dashboard.cypress.io/#/projects/4opx2c/runs)

## Writing Tests
Please see [Cypress documentation](https://docs.cypress.io/guides/overview/why-cypress.html#In-a-nutshell) for more information on how to write tests as well as explore tests which we currently have set up [here]((https://github.com/4dn-dcic/fourfront/tree/master/deploy/post_deploy_testing)).

## Tasks for the Future
- Possibly migrate Cypress test definitions to this repository as Cypress no longer needs to be installed in NPM along with other fourfront JS libraries (unless maybe running tests locally) in fourfront repo.
- Create similar suite of **integration** tests to be ran during/after build process, on the test data (lower priority).
