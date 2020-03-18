 # App level pages

App level pages are displayed when you first open an app.  Please refer to [permissions](https://github.com/kwantu/platformconfiguration/wiki/App-permissions) for how to control access to these.

| Page        | Function           | Status  |
| :------------- |:-------------| :-----|
| Profiles | This displays the profile search and filters | Required|
| Roles | This displays the roles at the app level | Required |
| Apex | This displays the apex workflow.  Multiple pages may be created to separate different workflows | Optional |
| Dashboard | This is an optional page that can be added to show a dashboard |Optional |
| [iFrame](https://github.com/kwantu/platformconfiguration/wiki/How-to-configure-an-iFrame-page) | This is an optional page that can be added to show an iFrame | Optional |

# Profile level pages

| Page        | ID | Function           | Status  |
| :-------------|:-------------|:-------------| :-----|
| Summary | details | This displays profile name and the app profile DO | Required|
| Roles | roles | This displays the profile level roles | Required|
| Workflow | processes | This displays the profile level workflow | Required |
| Data | data |This provides access to instances of data objects for a profile | Required |
| Actions | actions |This displays pending actions for a profile |Required |
| Category | |This displays the list of sub profiles for a category |Optional |
| Dashboard | dashboard |This is an optional page that can be added to show a dashboard |Optional |
| [iFrame](https://github.com/kwantu/platformconfiguration/wiki/How-to-configure-an-iFrame-page) | |This is an optional page that can be added to show an iFrame | Optional |
| [New instance](https://github.com/kwantu/platformconfiguration/wiki/How-to-configure-an-instance-type-workflow-page) | |This creates a page to navigate directly to an instance type workflow | Optional |
| Navigation | navigation | This displays the profile detailed profile navigation | Optional|
| Settings | settings | Used only on the community app.  Displays the settings page | Required|

### Sub profile level pages

| Page        |ID | Function           | Status  |
| :------------- |:-------------|:-------------| :-----|
| Summary | subprofile-details| This displays the summary page for the sub profile instance | Required|
| Roles | subprofile-roles| This displays the profile level roles | Required|
| Workflow | subprofile-processes| This displays the profile level workflow | Required |
| Dashboard | subprofile-dashboard| This is an optional page that can be added to show a dashboard |Optional |
| [iFrame](https://github.com/kwantu/platformconfiguration/wiki/How-to-configure-an-iFrame-page) |N/A | This is an optional page that can be added to show an iFrame | Optional |
| [New instance](https://github.com/kwantu/platformconfiguration/wiki/How-to-configure-an-instance-type-workflow-page) | N/A| This creates a page to navigate directly to an instance type workflow | Optional |