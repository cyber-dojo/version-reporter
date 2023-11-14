
# TODO: Fix external user in UX for Approval

#--------------------------------------------------------------------

# TODO: Change environment descriptions.

aws-beta == "The ECS cluster for staging cyber-dojo"
aws-prod == "The ECS cluster for production cyber-dojo"
There seems to be no API to do this.

# TODO: The branch name in the artifact view is empty "()"

# TODO: also send all kosli reports to https://staging.app.kosli.com

At the moment https://staging.app.kosli.com is showing the
cyber-dojo environments as being non-compliant.
This is correct. The version-reporter images are being seen as
no-provenance because there have been no artifact reports to https://staging.app.kosli.com
