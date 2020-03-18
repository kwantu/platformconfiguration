Created by Mark Besaans on 2018-12-11 at 8:55 SAST.

This page describes the **relationships between** the [list of Entities](https://github.com/kwantu/platformconfiguration/wiki/Entity-list) that constitute the Kwantu Platform.

The following table lists the relationships of the [ERD](https://drive.google.com/open?id=1th0L7YWti1COsTS9X8AL2J0sdpOXr6DS):

| Entity | Relationship | Entity |
|--------|--------------|--------|
| App | defined by an | App-Config-file |
| App | Is adopted by| Community |
| App-Config-file | contains definitions of | Data-Objects |
| App-Config-file | contains definitions of | Forms |
| App-Config-file | contains definitions of | Searches |
| App-Config-file | contains definitions of | Taxonomies 
| App-Config-file | defines an | App |
| Community | adopts | App |
| Community | defined by a | Community-Config-file |
| Community | is in a | Root-Community |
| Community-Config-file | defines a | Community |
| Data-Objects | are defined in a | App-Config-file |
| Profile | on a |  Server |
| Roles | of | Users |
| Roles | are associated with | Views / Permissions |
| Root-Community | has many | Community |
| Root-Community | is hosted on a | Server |
| Searches | are defined in a | App-Config-file |
| Server | has a | Root-Community |
| Server | Has a | Profile |
| Taxonomies | are defined in a | App-Config-file |
| Forms | are defined in an | App-Config-file |
| Forms | are defined in an | Views / Permissions |
| Users | have |  Roles |
| Views / Permissions | are defined in | Forms |
| Views / Permissions | have many | Roles |
 