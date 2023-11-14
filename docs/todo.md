
# TODO: Fix update-git-tracking-branch:

# TODO: Deployment diff not working for version-reporter

Eg https://app.kosli.com/cyber-dojo/environments/aws-beta/snapshots/2121?active_tab=running
The top-most artifact is cyberdojo/version-reporter:f497340
  https://app.kosli.com/cyber-dojo/flows/version-reporter/artifacts/6cc4af0e27e5399b0bc99da5f9cd5ae1c36d2e86ad353c1dbc7ec386b2196714
Its git commit URL is
  https://gitlab.com/cyber-dojo/version-reporter/-/commit/f4973405af09bb3d894f68c10d712321d86155ac
The artifact being replaced is cyberdojo/version-reporter:e78fff8
  https://app.kosli.com/cyber-dojo/flows/version-reporter/artifacts/afa3299d047f473d19caf66d7d25b39824a78309e6aa9160ca77845e1d19db96
Its git commit URL is
  https://gitlab.com/cyber-dojo/version-reporter/-/commit/e78fff829146281b76be1aff841c19e078a96da1
Both these URLs are valid and open ok (if you are a member of the Gitlab cyber-dojo Org)
But in the Kosli UX (from the 1st URL in this TODO)
Click its "Deployment diff" dropdown.
There is no Deployment diff URL...

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
