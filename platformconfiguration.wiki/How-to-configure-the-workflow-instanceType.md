Each workflow process must be defined as either a newSequence or a newInstance.  This article explains the difference between these two options and provides examples as to which you should use in which situation.

# Deciding which option to use

The option to choose depends on the purpose of the workflow.  The following examples may help decide which to use.

## Workflow process to create a new profile

In this example the workflow will create a new profile in your app.  In this case it must be limited to once instance only.  However, we can allow multiple sequences, as the data associated with the profile may need to be updated.

The workflow will create a new instance.  It has a maximum of one instance for the process (ie there can be only one profile).  Multiple sequences are allowed.  Deletion of sub profile instances is not allowed.

In the example below use newSequence to limit the process to only one instance.  The maxSequences is -1, which will allow for unlimited sequences of that instance.

```
"instanceType": {
    "newSequence": {
        "maxSequences": -1
    }
}
``` 
## Ad hoc workflow processes

In this example we look at situations where you need to record project site visits, outcomes or activities.  Common to these examples are that users will decide when to start the workflow (there is no pre-determined schedule that they must follow) and they need the option to record multiple site visits, outcomes or activities.

In this case we will instead use newInstance type workflow.  With this option we allow the user to create multiple instances of the same workflow.  We can specify how many instances they may create and if the instance may be deleted.  We can also specify how many sequences may be created for each instance.

```
"instanceType": {
    "newInstance": {
        "maxSequences": -1,
        "mayDelete": true,
        "maxInstances": 1
    }
},
```
| Parameter        | Explanation           | Values  |
| ------------- |:-------------:| -----:|
| maxInstances | The maximum number of instances allowed | Any number 1 or greater.  Use -1 for unlimited |
| maxSequences | The maximum number of sequences allowed | Any number 1 or greater.  Use -1 for unlimited |
| mayDelete | If the workflow process may be deleted | true or false |

## Periodic workflows

[Periodic workflows](https://github.com/kwantu/platformconfiguration/wiki/How-to-configure-a-periodic-workflow) are used to models processes that repeat according to a specific frequency.  Examples include recording daily attendance on a work site or monthly progress on a project.

In this case we could use either a newSequence or a newInstance type workflow.  We recommend using the newInstance option, as this will create a new instance of each data object for each period in the workflow.  This is often easier to work with when generating reports, as you can more easily compare data across periods.