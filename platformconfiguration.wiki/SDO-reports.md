Created by Rob Worthington, last modified on Jul 30, 2018.  Copied from Kwantu [wiki](http://w.kwantu.net/display/CON/SDO+reports) 2018-12-10.

# 1.0 Introduction
The SDO reports app is used to generate reports based on one or more data objects.  There is a three step process to configuring a new report:
* Ensure that any data objects you need to use have been transformed
* Create one or more views in the apex profile
* Configure a report that references one or more views

# 2.0 Views

Views are created and managed in the apex profile of the SDO reports app.  When creating a new view you may create an entirely new view or a union of two or more existing views.  Unions are used to join the same data object when it is used in several apps - and you wish to show data from each of those apps.

## 2.1 Creating a basic view

When creating a basic view complete the following fields:

* **Name** - Give a consistent and meaningful name for the view.  This name will appear in other menus, so must be clear and make sense at a later data as to what the view shows.

* **Description** - This is for internal reference only.

* **View type** -  Select 'basic'.

* **Group by** - This enables you to group data in the repeat.  If you choose yes, you must later select one or more fields to group by.

* **Applications** - Please select which application you want to create the view for.

* **Indicators** - Please select the data object you want to create the view for.  This will only show data objects in the app you selected.

* **Read data from repeat** - Each view will either look at the core fields in the data object data model or a specific repeat.  If you want to look at the core fields, select no.  Otherwise select yes and then in the next menu, select the repeat you wish to work with.

* **Filter details** - This section enables you to filter the data returned by the view.

* **Field** - Select the field you wish to filter on.

* **Operator** - Select if you are filtering on fields that include a value or exclude the value.

* **Value** - Select the value to filter on.

* **Group detail** - This enables you to select which field you use to group by, if you selected the 'group by' option above

* **Projection detail** - This section enables you to perform calculations on records within a grouping.  If you selected 'group by', you can now choose which field you wish to calculate a total for within the grouped results.  You can then choose to calculate the total as a sum, count or concatenation.

* **Field name** - Select the field you wish to calculate a total for.

* **Formula** - Select how you wish to calculate from fields in the grouping.

* **Alias detail** - This section enables you to specify an alias that is used for a field.  For example, you could re-name a field to use another name.

* **Fields** - This allows you to select which field you set the alias for.

* **Alias** - Here you may specify the alias.

## 2.2 Creating a union view
To create a union view, select two or more views that you already created.  This will create a new view that you can reference.  A union view should only be used if you need to join the same data object being used by two or more apps.  Otherwise you should use a join instead.

# 3.0 Reports

Each report is a separate profile.  When you create a report profile you can use one or more views from the list of views that you've created.  If you choose multiple views you must then specify how those views should be joined, by indicating which field that they share is used to connect them.

## 3.1 Creating a report

When creating a report, complete the following fields:

* **Name** - This name will be shown on the report

* **Description** - This field is currently for internal purposes only

* **Template** - There is only one template at present

* **Context** - Select approved or pending data

* **View list** - This repeat structure allows you to select which views you will use in your report.  Any view referenced in the report must first be selected here.

* **Join** - This repeat structure allows you to specify which views you will join and how.  You may add a new row for each join.  When joining two views you must select:

   * **Left view** - Select the first view you wish to join
   
   * **Left field** - Select which field in that view you wish to join on.  Normally this will be the profile UUID or the document ID (ie the data object UUID)
   
   * **Right field** - Select the second view you wish to join
   
   * **Right field** - Select the same field that you choose for the first view
   
   * **Join type** - Select from full (all fields from both views are included), inner (only fields in common on both views are included) or left (all the fields from the left view are included, plus matching ones from the right view)
   
* **Select** - This repeat allows you choose which fields from which view you wish to include on the report.  For each row you must select:
   
   * **View** - The view from which you want to select fields
   
   * **Field** - The field from the view
   
   * **Header** - The column header you wish to use for that field

### 3.1.1 Core fields

All data objects have a shared set of core fields.  These will always appear in the field list alongside any other fields specific to that data object.  These core fields are:

* **Document title** - profile name

* **Document id** - atom UUID / profile ID

* **Document category** - set ID

* **Profile UUID** - profile ID

* **Community Id** - The ID of the community

* **Application Id** - The ID of the application

* **Sub-profile Id** - The ID of the sub-profile

* **Meta sequence** - Approved sequence number

* **Entry status** - Status of atom entry (pending, authorised)

* **Name** - The wrapper name set for the data object instance

* **Description** - The wrapper description set for the data object instance

* **Reference No** - The reference number set for the data object instance

**Status** - The status of the data object instance (approved or pending)

## 3.2 Updating a report

There is a workflow process to update a report.  You may change any of the responses set above.

## 3.3 Executing a report

There is a workflow process to execute a report.  This allows you to specify which users will receive the report.

[How to track the report execution for debugging](http://w.kwantu.net/display/CON/How+to+track+the+report+execution+for+debugging)

[How to create an exception report](http://w.kwantu.net/display/CON/How+to+create+an+exception+report)

[How to configure a report that hides duplicate rows for repeat data]()

[How to check and update the data dictionary](http://w.kwantu.net/display/CON/How+to+configure+a+report+that+hides+duplicate+rows+for+repeat+data)

[How to get the JSON feed URL for a report](http://w.kwantu.net/display/CON/How+to+check+and+update+the+data+dictionary)

[How to configure custom reports](http://w.kwantu.net/display/CON/How+to+get+the+JSON+feed+URL+for+a+report)