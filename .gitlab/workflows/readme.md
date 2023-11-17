
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