Created by Rob Worthington, last modified on Dec 15, 2017.  Copied from Kwantu [wiki](http://w.kwantu.net/display/CON/Roles) 2018-12-10.

# Permissions
**The following table documents the available modules and elements.**

|Module|Element attribute|Element name|Explanation|How to see an example of the element|Allowed actions|
|--|--|--|--|--|--|
|Profile|Page|ProfileDetails|The Details page|Click on the name of a profile in a list. This is the first page (which loads by default).|View|
|Profile|List|Instances|List of profile instances on app page|Click on the name of an app that has been adopted by your community.|View|Add|Delete
|Profile|Box|GeneralDetails|Details box on Details page|Visit a profile, note the section titled Details.|View|
|Profile|Box|MemberDetails|Roles box on Details page|Visit a profile, note the section titled Profile Roles.|View|Add|Delete|
|Profile|Box|Instruction|||View|
|Profile|Box|Linkages|Box that show parent profiles (eg linked participants)||View|
System|Menu|Settings|Determines which role may see the settings page to view the language switcher||View|
|System|Menu|CommunityRoles|Determines which role may see the community roles page||View|
|Workflow|Page|WorkflowDetails|The process page|Visit profile and then move on the Process tab(next to the profile tab).|View|
|Workflow|Process|(Specify process name)|Process tab provide and overview of the workflow process.|Visit profile and then move on the Process tab(next to the profile tab).|View; Add; Delete; Edit|
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

# Actions

|Action|Explanation|
|--|--|
|view|May view this page
|add|May add an entry, typically into
|a box/fieldset|list of profiles, i.e. may create a profile instance
|edit|May edit/update an entry
|delete|May delete an entry (e.g. user to role mapping or profile)

# Action roles

|Action role|Explanation|
|--|--|
|*|All roles assigned this action|
||No roles assigned this action|
|Role name|Specific role named is assigned this action|

# Test cases
Profile / Page - View = *

Workflow / Page - View = Adoption role type + Sub-profile role type

Indicator / Page - View = Profile role type + Community role type

Linkages / Page - View = None
