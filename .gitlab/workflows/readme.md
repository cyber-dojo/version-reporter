
When showing CI workflows in Kosli demos, there is a tension created
by the fact that cyber-dojo Flows are unusual in that they need to 
repeat every Kosli step twice; once to report to https://app.kosli.com
and once again to report to https://staging.app.kosli.com
A normal customer CI workflow yml file would only report to the former.
To resolve this, git pushes trigger two workflows:

1) prod.yml which reports to https://app.kosli.com
2) staging.yml which reports to https://staging.app.kosli.com
   This is basically the same as prod.yml but it does NOT
   - rebuild the docker image (since the build is not binary reproducible)
   - deploy the image to aws-beta/aws-prod (since prod.yml already does that)
    
During a demo, look at prod.yml.

Note:
You cannot set the api-token like this:

start-kosli-trail:
  extends: [ .only-main ]
  stage: kosli-trail
  variables:
    KOSLI_API_TOKEN: ${KOSLI_STAGING_API_TOKEN}
  script:
    - kosli create flow ${KOSLI_FLOW}
        --description="UX for git+image version-reporter"
        --template=artifact,branch-coverage,security-scan,pull-request

This does not work, presumably because there is an _existing_ CI variable
called KOSLI_API_TOKEN which, it appears, you cannot override.
So it is being explicitly set in each kosli command:

start-kosli-trail:
  extends: [ .only-main ]
  stage: kosli-trail
  variables:
    KOSLI_STAGING_API_TOKEN: ${KOSLI_STAGING_API_TOKEN}
  script:
    - kosli create flow ${KOSLI_FLOW}
        --description="UX for git+image version-reporter"
        --template=artifact,branch-coverage,security-scan,pull-request
        --api-token=${KOSLI_STAGING_API_TOKEN}

This means that you do not need to specify the KOSLI_API_TOKEN in
the prod.yml CI workflow, which is the main one that will be looked
at in demos.


