[back](https://github.com/kwantu/platformconfiguration/wiki)

# Generic server side actions
Increasingly server side actions are written to be generic and able to be re-used. This page documents those. There are other actions that are specific to a particular client. Those will be documented elsewhere.

## Generic rest based server side actions


## Generic server side actions running in node.js
This is a set of generic services running in node.js. These actions are not suitable for long running processes that needs to do a lot of processing, such as an import service for instance. For such services, use the rest based server actions above, because it focusses the control in the rest service engine, and does not tie up node.js with the results. Examples are imports, data migration, reports etc.

### Generic import of a spreadsheet into a repeat
This service takes an uploaded excel spreadsheet, and loads the records into a repeat. [See the details here](https://github.com/kwantu/platformconfiguration/wiki/Workflow-Configuration-of-Server-side-actions-xlsxImport)

