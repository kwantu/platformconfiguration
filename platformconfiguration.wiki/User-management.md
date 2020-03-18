The user management section enables users to create new user accounts and assign them the member role on a community.  They may also de-activate user accounts.

# Accessing the user management area

To view the user management area, a user must first be assigned a role in the community that enables them to view the UserManagement box on the settings page.  The following permission block determines which community roles may view this area.  In this example the role id Administrator may view this area.

```
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
                }
            ]
        }
    ],
```

# Creating a user account

To create a user account, open the settings page and scroll to the user management section.  Please follow these steps:

1. Click the 'Create' button
2. Enter the username (normally an email address), first name, last name and email for the user
3. Click 'Community settings' to open the list of communities that you have access too
4. Find the community or communities for which you wish to assign the member role to this users
5. Click 'Save'
6. The account is created and the user's password is displayed temporarily.  The user will be receive an email with their login details.  Their account will be assigned the member role on the selected communities.

# Editing a user account


# Assigning or removing the member role


# Reseting a user's password


# 