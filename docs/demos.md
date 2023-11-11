Here is a URL for a cyber-dojo practice session
https://beta.cyber-dojo.org/kata/edit/9yAkDD
Click the (i) button on the top bar (to the right of the ID==9yAkDD)
This reveals 5 buttons.
Then click the [versions] button.
This will take you to:
https://beta.cyber-dojo.org/version-reporter/index
This shows the git commit (+link) for all microservices (including version-reporter itself)


# Fail deployment when a commit lowers code coverage

Go into the `test/server` directory and rename the
file `ready_test.rb` to `ready_test.rb.off` and then commit
and push. The branch-coverage will be reported to kosli
as non-compliant. The user-data json contains...
```json
{ 
  "server": {
    "groups": {
        "app": {
            "lines": {
                "covered": 64,
                "missed": 5,
                "total": 69
            }
        },
```

# Fail deployment when an insecure dependency is added to the image

It is not easy to explicitly install a package with known insecurity.
The Alpine package manager has to be bypassed which means
you have to build the package from source. This can take a _long_ time
and so is not great for a demo. It is much, much faster to simply
change to an older base image. 
Edit `Dockerfile`'s first line from
```ARG BASE_IMAGE=cyberdojo/sinatra-base:b9e9885```
to
```ARG BASE_IMAGE=cyberdojo/sinatra-base:bbb7973```
and then commit and push.

# Fail deployment when a pull request is not found for the change
Do a commit that is not in a pull-request!
WIP

# Alert when a manual deployment is made
WIP

# Use the kosli assert artifact command as policy enforcement point
See sdlc-gate-job: in .gitlab-ci.yml

# Gitlab Demo

Lead time from commit to aws-prod is going to be ~10min
(or ~7mins if we don't deploy to aws-beta).

If you do each one demo for each of the three test jobs it will take a long time!
You could do all three in one commit
  1) add snyk vulnerability
  2) comment out tests
  3) git push not in pull-request
You could make a pre-recorded video and get JC to cut out the waiting?
These would be great for social media...
