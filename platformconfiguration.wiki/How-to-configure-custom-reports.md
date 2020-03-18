Created by Rob Worthington, last modified on Nov 20, 2018. Copied from Kwantu [Wiki](http://w.kwantu.net/display/CON/How+to+configure+custom+reports) on 2018-12-13.

We have defined a series of custom reports that can access data not available in the standard reports user interface.  They can also include custom layouts.  Access them here.

|Name	|Source file	|URL	|
|-------|---------------|-------|
|Workflow	|wfConfigurationPerCommunity.jrxml	Download file	|https://kwantu.me/exist/rest/db/kwantu-resource/reports/configuration/roles.xql?communityId=051a4973-d2fa-475d-ef66-e80b27c576f0&action=workflow|
|Community users	|usersPerCommunity.jrxml	Download file	|https://kwantu.me/exist/rest/db/kwantu-resource/reports/user/userReport.xql?communityId=75b6528e-f7de-4f84-ab22-8428a20e28a1|
|Community roles	|rolesPerCommunity.jrxml	Download file	|https://kwantu.me/exist/rest/db/kwantu-resource/reports/configuration/roles.xql?communityId=051a4973-d2fa-475d-ef66-e80b27c576f0&action=roles|
|Community permissions	|permissionsPerCommunity.jrxml	Download file	|https://kwantu.me/exist/rest/db/kwantu-resource/reports/configuration/roles.xql?communityId=051a4973-d2fa-475d-ef66-e80b27c576f0&action=permissions|
|Community data objects	|indicatorsPerCommunity.jrxml	Download file	|https://kwantu.me/exist/rest/db/kwantu-resource/reports/configuration/roles.xql?communityId=051a4973-d2fa-475d-ef66-e80b27c576f0&action=indicators

To set-up a new custom report you must do the following:
1. Download the JRXML file from the link above
1. Create a new report in your community
1. Select JRXML file (custom layout)
1. Enter the URL from the table above (changing the UUID for that of the community)
1. Save the form
