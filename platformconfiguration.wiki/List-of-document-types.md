List of file types that need to be replicated to work locally. 

**Data**

* processes file - profileId:processes
* profileId:roles
* subprocesses file - subprocessUUID
* indicators - indicator UUID
* indicatorApproved - indicator UUID:approved
* attachemnt - indicator UUID:attachments
* thumbnails - indicator UUID:thumbnails
* graphs data - indicator UUID:graph
* data - indicator UUID:data
* profileVariable - profileId:variables


* subprofile node file - Which is indicator file [from profile:processes navigation array]
* subprofileId:processes file
* subprofileId:variables
* subprofileId:roles
* subprocesses from subprofileId:processes file
* indicators from subprocesses of subprofileId:processes
* indicatorApproved - indicator UUID:approved
* attachemnt - indicator UUID:attachments
* thumbnails - indicator UUID:thumbnails
* graphs data - indicator UUID:graph
* data - indicator UUID:data

* adoptionId:roles
* communityId:roles




**Config files**

* adoptionConfig
* Community Config ( For app versions)
* applicationConfig_applicationId:version - App config
* setId_version model file
* setId_version_config file
* indicator views - desktop - mobile etc.
* processDefinition file (Workflow)
* search_search Id files

