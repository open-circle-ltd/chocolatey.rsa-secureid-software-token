# Chocolatey Package: rsa-secureid-software-token

## Description

RSA SecurID, formerly referred to as SecurID, is a mechanism developed by RSA for performing two-factor authentication for a user to a network resource.
## Package Parameters
Command-line options for installer configuration. See the [official page](https://community.securid.com/t5/securid-knowledge-base/installing-the-same-rsa-securid-software-token-5-0-for-windows/ta-p/1288) for details and defaults.

- `/SETCOPYPROTECTION:OPTION` to remove the binding of the token to the specific machine on which the token is imported; and thus to be able to find it on any other machine.
- `/SETSINGLEDATABASE:OPTION` to remove the binding of the token to the specific user accessing the machine.  The installation is still secured as the token is stored in the home drive of each user and cannot be accessed by any other user.
- `/SETDATABASEDIR:OPTION` to install the database containing the user’s software token to a location other than the default directory.

### Examples
`choco install rsa-secureid-software-token --params "/SETCOPYPROTECTION:FALSE"` <br>
`choco install rsa-secureid-software-token --params "/SETCOPYPROTECTION:FALSE /SETSINGLEDATABASE:FALSE"` <br>
`choco install rsa-secureid-software-token --params "/SETCOPYPROTECTION:FALSE /SETSINGLEDATABASE:TRUE /SETDATABASEDIR:<DRIVE_LETTER>\<PATH>"` <br>

## Installation

```ps1
choco install rsa-secureid-software-token
```


## Author

- [Benaiah Matthew Catherasoo](https://github.com/bmcatherasoo)
- [Open Circle AG](https://www.open-circle.ch)


## Copyright

&copy; 2022, Open Circle AG
