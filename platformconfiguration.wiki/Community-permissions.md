Permissions may be defined at the community level to manage access by user role.  Currently there is only one permission available the community level, which controls which user role(s) may access the user management area.

The following code example shows how to define which roles may view the user management area and which may view the community level role assignment.  Add additional roles with other role IDs to grant additional roles access to view this area.

```JSON
    "permissions": [
        {
            "module": "System",
            "elements": [
                {
                    "box": "UserManagement",
                    "actions": {
                        "view": [
                            "Administrator"
                        ]
                    }
                },
                {
                    "menu": "CommunityRoles",
                    "actions": {
                        "view": [
                            "Administrator"
                        ]
                    }
                }
            ]
        }
    ],
```
Permissions may also be defined at the app level.  See this article for details.