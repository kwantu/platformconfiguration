Created by Rob Worthington on Aug 28, 2017. Copied from Kwantu [Wiki](http://w.kwantu.net/display/CON/How+to+create+an+exception+report) on 2018-12-13.

## Introduction
Exception reports are designed to help clients track data entry across a number of project or other profiles.  They provide a high level summary of how many instances of each type of form have been created, captured or authorised.

These reports are useful to help clients manage where data is expected, but missing.

## Creating the views
To create an exception report you need to create two types of views:

### Profile creation object
Profile creation object
You probably have this view already, as it is a standard view designed to extract the object used to create the profile.  If not, create a basic view for this data object.

### Data object
Create a separate data object view for each data object that you need to include in the exception report.  Each view should have the following configuration:

* Name - Data object name (Grouped and counted)
* View type - Basic
* Application - Select the App
* Data object - Select the data object
* Read data from repeat - No
* Group by - Yes
* Grouping section, select the following fields:
* Profile UUID
* Document category
* Entry status
* Projection section, select the following fields:
* Field - Document id
* Formula - Count
The view is designed to extract only the fields selected in the grouping, plus a new field that is created that will count how many instances of the data object have been generated.

## Creating the report
You are now ready to create the report.

When creating the report, select all the views created above.  Then in the join section select the profile creation object view on the left and the data object view on the right.  Add a new row for each pair.  Join both fields on the profile UUID.  In the data object view, this will be called 'profile_id' as the grouping has modified the field name.

Finally, in the field section select first the fields from the profile creation view to give context to the report.  Then for each data object view select:

* Set ID - the name for the category of data object
* Status - the workflow status for the data object category
* _id - the count of how many instances of that data object category have been created

You are now ready to save and test the report.

