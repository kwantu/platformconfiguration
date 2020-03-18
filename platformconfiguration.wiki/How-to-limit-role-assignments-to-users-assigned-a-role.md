When a workflow is active users with the relevant role defined in the permissions may re-assign the workflow to another user.  The default option is that they may assign to any user on that community.  The alternative is to restrict re-assignment only to users that have been assigned the role specified for the current workflow step.

This option is defined in the application adoption configuration file by adding the following property:

```
reassignmentMode == "restricted"
```
This configuration applies to app, profile and sub profile level workflows.


