Permissions may be defined at the app level.  These determine what users may see and do in the app.  Permissions are grouped by modules and defined at the level of elements.  Each element includes actions that determine what users with a role may do in relation to each element.

# Actions

The following actions are available.  Elements may not use all actions.

| Action        | Explanation  |
| :------------- |-------------|
| view | View an element |
| add | Add an element (if possible for the element type) |
| edit | Edit an element (if possible for the element type) |
| delete | Delete an element (if possible for the element type) |

# Roles

Permissions are managed by specifying which user role may carry out which action in relation to which element.  You may also specify that all users can carry out an action or that no users may do so.  The following table explains the options.

| Action role      | Explanation  |
| :------------- |:-------------|
| * | All users may carry out this action, regardless of role |
| | No users may carry out this action, regardless of role |
| role id | Only users assigned this role may carry out the action |

# Permissions

The following table lists the available elements.

|Module|Element attribute|Element name|Explanation|How to see an example of the element|Allowed actions|
|--|--|--|--|--|--|
|Profile|Page|ProfileDetails|The Details page|Click on the name of a profile in a list. This is the first page (which loads by default).|View|
|Profile|List|Instances|List of profile instances on app page|Click on the name of an app that has been adopted by your community.|View|Add|Delete
|Profile|Box|GeneralDetails|Details box on Details page|Visit a profile, note the section titled Details.|View|
|Profile|Box|MemberDetails|Roles box on Details page|Visit a profile, note the section titled Profile Roles.|View; Add; Delete|
|Profile|Box|Instruction|||View|
|Profile|Box|Linkages|Box that show parent profiles (eg linked participants)||View|
System|Menu|Settings|Determines which role may see the settings page to view the language switcher||View|
|System|Menu|CommunityRoles|Determines which role may see the community roles page||View|
|Workflow|Page|WorkflowDetails|The process page|Visit profile and then move on the Process tab(next to the profile tab).|View|
|Workflow|Process|(Specify process name)|Process tab provide and overview of the workflow process.|Visit profile and then move on the Process tab(next to the profile tab).|View; Add; Delete; Edit, Fix|
|Workflow|box|reassign|Determines which role may view the re-assign widget||View
|Indicator|Page|Registry|The data page|Visit profile and then move on the Data tab(next tab to the the workflow tab)|View
|Indicator|Indicator|(Specify process name)|Limit ability to view, add or edit for a specific data object|Visit profile and then move on the Data tab(next tab to the the workflow tab)|View
|Linkages|Page|ProfileLinkages|The linkages page|Visit profile and then move on the next tab to the data tab.|View|
|Linkages|box|Linkages|Help text box on linkages|The page that provides an information of the linked profile.|View|
|Application|box|MemberDetails|Adoption level roles assignment box||View; Add; Delete|
|Application|button|follow|The button to synchronise all profiles||view|
|Subprofile|button|ClearNode|The button to reset a node's configuration||view|
|Subprofile|box|MemberDetails|The box to assign node level roles||add; delete; view
|Subprofile|category|(Specify category ID)|This controls which role may view which category||view|