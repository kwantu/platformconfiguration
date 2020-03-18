# Introduction

The Kwantu platform includes a fully configurable workflow engine.  This is used to define the business logic in a workflow configuration file for the app.  All communities adopting and using an app will use the same workflow.  By editing this [configuration](https://github.com/kwantu/platformconfiguration/wiki/Workflow-configuration-file) file you can define the workflow followed in the app.

# Key concepts

## Process, sub processes and steps

The workflow for an app may have one or more processes.  Each process has it's own set of business rules.  For example, one process may deal with creating a new project.  Another may cover registration of the project business plan and another reporting monthly on progress against the business plan.  In this way you can define multiple workflow processes that collectively define the business logic needed for your app.  The process may also include requisites that must be met before the process can start.  They may also include pre or post actions.

Each process must have one or more sub processes.  Each sub process specifies one or more data objects that will be used in that sub process.  These data objects must also be included in the app config file.  

Each sub process must have one or more steps.  Each step may either be an [action](https://github.com/kwantu/platformconfiguration/wiki/Workflow-actions) step (in which the workflow carries out one or more actions) or a task step (in which a specific user role is assigned one or more data objects).  Steps may include transitions, that determine which step (or steps) follow.  They may also include pre or post actions for the step.  The step may also reference one or data objects (limited to those specified in the sub process) and a specific view of the data object.

## Apex, profile and sub profile level workflow processes

Each workflow process may operate at one of three different levels in the app.  These are described in the following table.

| Level        | Explanation           |
| ------------- |:-------------:|
| Apex      | Apex level workflows are shown at the app level.  They are typically used to manage app configuration, for example setting defaults or editing taxonomies |
| Profile      | Profile level workflows are shown on an app profile.  These are used to manage data related to the profile |
| Sub profile      | Sub profile workflows are used in cases where it is useful to have a second level for an app.  You may have different types of sub profile within the same app. |

## Valid date and due date

Each workflow sub process has two dates associated with it.  The valid date (or business date) is the date used to link the data from the sub process to a reporting period.  The due date is used to set a deadline for completing the workflow.  Both dates may be entered manually by users or calculated from parameters that you define.

## Instances and sequences

Each time a user starts (instantiates) a new workflow sub process, a new instance is created and the first sequence of that instance.  If the user interacts further with the same sub process instance then additional sequences are created.  Each sequence stores the data associated with what was done for that sequence.  This provides a full audit trail of all changes made.

Each workflow process may be configured either as a newInstance or newSequence type.  Please see the table below for details of these options.

| Type        | Explanation           |
| ------------- |:-------------:|
| newInstance      | Each time the workflow for this process is instantiated, a new instance is created - and a the first sequence of that instance.  You may define the maximum number of instances and sequences allowed.  Users may create additional instances up to the limit specified. |
| newSequence      | The first time the workflow for this process is instantiated, a new instance and sequence is created.  Thereafter, a new sequence is created for that instance.  No additional instances are allowed. |

[See this article for more guidance](https://github.com/kwantu/platformconfiguration/wiki/How-to-configure-the-workflow-instanceType)

## Periodic, ad hoc and cover page workflows

Each workflow process must either be defined as periodic, ad hoc or cover page.  These different types are explained in the table below.

| Type        | Explanation           | Guidance  |
| ------------- |:-------------:| -----:|
| Periodic      | Periodic workflows are designed to model periodic processes.  For example a process where a report must be submitted every month or a process where attendance must be taken every day.  This type of workflow creates a new sequence for each period and sets the valid date as that for the next period.  This ensures that every sequence is linked to a specific reporting period. | [Guidance on periodic workflows](https://github.com/kwantu/platformconfiguration/wiki/How-to-configure-a-periodic-workflow) |
| Ad hoc      | Ad hoc workflows are not linked to any periodicity.  This type of workflow is used when you need to create any number of new instances.  As each instance is further edited, new sequences are created.  For example, reporting site visits or requesting a cash advance. | See this article for more guidance |
| Cover page | Cover page workflows are designed to model ongoing processes they may continue for some time.  For example, a planning process in which multiple people must contribute information or sign off on a checklist.  The workflow will create a new sequence each time the workflow is assigned to the next person | See this article for more guidance |

## Linking Indicators to the workflow

Indicators are linked to a subProcess through two tags:
1. indicators
2. referenceIndicators <br>

[See more details here](https://github.com/kwantu/platformconfiguration/wiki/Workflow_link_indicators_to_workflow)

## Transition

Transitions manage the process whereby the workflow moves from one step to another. The transition tag in each step manages the process

[More info here](https://github.com/kwantu/platformconfiguration/wiki/Workflow_Transitions_configuration)

## Notifications

Workflow may also generate notification messages.  These may be sent to the user assigned a step or to all users with the role designated for a step.  Notifications can be generated as part of a step pre or post action.  They may also be generated is a step is overdue after a specific time period.  [More on notifications](https://github.com/kwantu/platformconfiguration/wiki/Notifications)

# How to articles

Please refer to the following how to guides for guidance.

* [How to configure a periodic workflow](https://github.com/kwantu/platformconfiguration/wiki/How-to-configure-a-periodic-workflow)

* [How to set the title for a workflow sub process instance](https://github.com/kwantu/platformconfiguration/wiki/How-to-set-the-title-for-a-workflow-sub-process-instance)

* [How to set variables in a workflow sub process instance - example of managing periods](https://github.com/kwantu/platformconfiguration/wiki/How-to-set-the-variables-for-a-workflow-to-manage-periods)

* [How to limit workflow re-assignment to only users assigned the role for the current step](https://github.com/kwantu/platformconfiguration/wiki/How-to-limit-role-assignments-to-users-assigned-a-role)