# Cypress Post-Deployment Tests

## Archived

As of 2021-04-28, this repository is archived. We have migrated to using Github Actions and this documentation is now outdated. Cypress tests now run using Github Actions of the main fourfront repo itself.

## What this repository does

_Post-Deploy_ Cypress tests from the [fourfront repository](https://github.com/4dn-dcic/fourfront/tree/master/deploy/post_deploy_testing) are imported and ran by code in this repository on the Travis Continuous Integration VM(s) (which pre-installs browser and other necessities). The file "./config.sh" contains per-branch configuration settings such that each different branch of _this repository_ will run against a different environment.

These tests are meant to be ran after deployment to a **staging** environment and prior to swapping the staging environment with the stable production envornment to ensure that the **staging** environment has not regressed from **production**.

**Since these tests run against a live database(s), any edits/changes performed by tests must be cleaned up by the test itself or in a foursight check/action.**

## How to manually trigger a test

- Go to https://travis-ci.org/4dn-dcic/post-deploy-cypress-tests
- Ensure are logged in.
- In the drop-down menu at top right, click "Trigger Custom Build"
- Select branch to run on, which corresponds to domain name tested against (staging or data environment)
- Fill in any random message for "Commit Message", leave "Configuration" box blank.
- Press "Trigger", and wait for tests to run and related videos, screenshots, and reports to be displayed on the  [Cypress Dashboard](https://dashboard.cypress.io/#/projects/4opx2c/runs)

## Writing Tests
Tests should be written (at this time) in the [fourfront repository](https://github.com/4dn-dcic/fourfront/tree/master/deploy/post_deploy_testing). They can be ran locally against any environment (including localhost) to help build & troubleshoot the test(s).
Please see [Cypress documentation](https://docs.cypress.io/guides/overview/why-cypress.html#In-a-nutshell) for more information on how to write tests as well as explore tests which we currently have set up [here]((https://github.com/4dn-dcic/fourfront/tree/master/deploy/post_deploy_testing)).

## Tasks for the Future

### Integration Tests
 Currently these are **post-deployment** (or smokestack) tests to be ran against live or close-to-live database(s). At one point we had a separate suite of **integration** tests running on Travis CI which would utilize test data, however this was disabled due to Travis CI run duration limits most of which was taken up by ElasticSearch bootup/indexing. These causal issues (ElasticSearch bootup) should now be handled (using AWS ES instance for tests), so creating an additional directory of Cypress tests in the fourfront repo to be ran on build should be feasible again.

### Test Location (Low Priority / Moot)
We coould possibly migrate Cypress test definitions to this repository as Cypress no longer needs to be installed in NPM along with other fourfront JS libraries (unless maybe running tests locally) in fourfront repo.
