---
order: -1
---

Users removed from the DocSpace portal are specified with the `LostUser` constant, which is a `UserInfo` object in the following format:

``` cs
public static readonly UserInfo LostUser = new()
{
    Id = new Guid("{4A515A15-D4D6-4b8e-828E-E0586F18F3A3}"),
    FirstName = "Unknown",
    LastName = "Unknown",
    ActivationStatus = EmployeeActivationStatus.NotActivated
};
```

This object is also used for all users not found in the DocSpace portal (guests, users with the pending activation status, etc.).

## Parameters

### Id

The user ID. The removed users always have the `{4A515A15-D4D6-4b8e-828E-E0586F18F3A3}` ID.

Type: string

Value: `new Guid("{4A515A15-D4D6-4b8e-828E-E0586F18F3A3}")`

### FirstName

The user first name.

Type: string

Value: "Unknown"

### LastName

The user last name.

Type: string

Value: "Unknown"

### ActivalionStatus

The user activation status ("NotActivated" or 0).

Type: string | integer

Value: `EmployeeActivationStatus.NotActivated`

For example, when sending GET requests to the `api/2.0/people/email` or `api/2.0/people/{userid}` addresses, the `LostUser` ID is used to check if a user with the specified email or name exists. If the user ID is equal to the `LostUser` ID, this user is removed from the portal and a 404 status code is returned (`User not found`).
