Roles may be defined at the community level.  Provision is made to map community roles to app roles.  This will enable community owners to map their existing roles to those specified on apps that they adopt.  Community roles may also be mapped to permissions for the community.

Community roles are defined in the community configuration file.  The following example shows the role name (displayed to users) and id (used to reference the role in other configuration files).

```JSON
    "roles": [
        {
            "name": "Administrator",
            "id": "Administrator"
        }
    ],
```