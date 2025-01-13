---
order: -10
---

For the WOPI protocol setup, it is necessary to edit the WOPI parameters in the configuration file, which can be found (or created) at the following path:

For Linux - `/etc/onlyoffice/documentserver/local.json`.

For Windows - `%ProgramFiles%\ONLYOFFICE\DocumentServer\config\local.json`.

> The default values are available in the `default.json` configuration file, which is available in the folders above (for Linux and Windows). Please do not edit the contents of the `default.json` file directly. The default values will be restored each time you restart Docker container or upgrade ONLYOFFICE Docs to a new version and all your changes will be lost.

Restart the services for the config changes to take effect:

For RPM/DEB packages:

``` sh
systemctl restart ds-*
```

For Docker:

``` sh
supervisorctl restart all
```

## Parameters

### wopi.enable

Defines if WOPI is enabled or not.

Type: boolean

Example: false

### wopi.host

Defines the WOPI host (host name or IP address).

Type: string

Example: ""

### wopi.htmlTemplate

Defines a path to the WOPI HTML template.

Type: string

Example: "../../web-apps/apps/api/wopi"

### wopi.wopiZone

Defines a zone that the document server uses to navigate the browser to the WOPI application.

Type: string

Example: "external-http"

### wopi.favIconUrlWord

Defines a path to the favicon for the document editor.

Type: string

Example: "/web-apps/apps/documenteditor/main/resources/img/favicon.ico"

### wopi.favIconUrlCell

Defines a path to the favicon for the spreadsheet editor.

Type: string

Example: "/web-apps/apps/spreadsheeteditor/main/resources/img/favicon.ico"

### wopi.favIconUrlSlide

Defines a path to the favicon for the presentation editor.

Type: string

Example: "/web-apps/apps/presentationeditor/main/resources/img/favicon.ico"

### wopi.favIconUrlPdf

Defines a path to the favicon for the pdf editor.

Type: string

Example: "/web-apps/apps/pdfeditor/main/resources/img/favicon.ico"

### wopi.fileInfoBlockList

Defines a list of WOPI file information parameters that are blocked when sending this array to the browser. However, these parameters are available on the server.

Type: array of strings

Example: \["FileUrl"]

### wopi.pdfView

Defines the file types that can be viewed in the pdf editor.

Type: array of strings

Example: \["djvu", "xps", "oxps"]

### wopi.pdfEdit

Defines the file types that can be edited in the pdf editor.

Type: array of strings

Example: \["pdf"]

### wopi.forms

Defines the form file types.

Type: array of strings

Example: \["pdf"]

### wopi.wordView

Defines the file types that can be viewed in the document editor.

Type: array of strings

Example: \["doc", "dotm", "dot", "fodt", "ott", "rtf", "mht", "mhtml", "html", "htm", "xml", "epub", "fb2", "sxw", "stw", "wps", "wpt", "docxf", "oform"]

### wopi.wordEdit

Defines the file types that can be edited in the document editor.

Type: array of strings

Example: \["docx", "dotx", "docm", "odt", "txt"]

### wopi.cellView

Defines the file types that can be viewed in the spreadsheet editor.

Type: array of strings

Example: \["xls", "xlsb", "xltm", "xlt", "fods", "ots", "sxc", "xml", "et", "ett"]

### wopi.cellEdit

Defines the file types that can be edited in the spreadsheet editor.

Type: array of strings

Example: \["xlsx", "xltx", "xlsm", "ods", "csv"]

### wopi.slideView

Defines the file types that can be viewed in the presentation editor.

Type: array of strings

Example: \["ppt", "ppsx", "ppsm", "pps", "potm", "pot", "fodp", "otp", "sxi", "dps", "dpt"]

### wopi.slideEdit

Defines the file types that can be edited in the presentation editor.

Type: array of strings

Example: \["pptx", "potx", "pptm", "odp"]

### wopi.publicKey

Defines the public key that the integrator uses to check the private key.

Type: string

Example: "BgIAAACkAABSU0ExAAgAAAEAAQBpTpiJQ2hD8plpGTfEEmcq4IKyr31HikXpuVSBraMfqyodn2PGXBJ3daNSmdPOc0Nz4HO9Auljn8YYXDPBdpiABptSKvEDPF23Q+Qytg0+vCRyondyBcW91w7KLzXce3fnk8ZfJ8QtbZPL9m11wJIWZueQF+l0HKYx4lty+nccbCanytFTADkGQ3SnmExGEF3rBz6I9+OcrDDK9NKPJgEmCiuyei/d4XbPgKls3EIG0h38X5mVF2VytfWm2Yu850B6z3N4MYhj4b4vsYT62zEC4pMRUeb8dIBy4Jsmr3avtmeO00MUH6DVyPC8nirixj2YIOPKk13CdVqGDSXA3cvl"

### wopi.modulus

Defines the RSA modulus in the Base64-encoded format that is used to retrieve the public key.

Type: string

Example: "5cvdwCUNhlp1wl2TyuMgmD3G4iqevPDI1aAfFEPTjme2r3avJpvgcoB0/OZREZPiAjHb+oSxL77hY4gxeHPPekDnvIvZpvW1cmUXlZlf/B3SBkLcbKmAz3bh3S96sisKJgEmj9L0yjCsnOP3iD4H610QRkyYp3RDBjkAU9HKpyZsHHf6clviMaYcdOkXkOdmFpLAdW32y5NtLcQnX8aT53d73DUvyg7XvcUFcneiciS8Pg22MuRDt108A/EqUpsGgJh2wTNcGMafY+kCvXPgc0NzztOZUqN1dxJcxmOfHSqrH6OtgVS56UWKR32vsoLgKmcSxDcZaZnyQ2hDiZhOaQ=="

### wopi.exponent

Defines the RSA exponent in the Base64-encoded format that is used to retrieve the public key.

Type: string

Example: "65537"

### wopi.privateKey

Defines the private key that signs the document server request.

Type: string

Example: "-----BEGIN PRIVATE KEY-----\nMIIEvwIBADANBgkqhkiG9w0BAQEFAASCBKkwggSlAgEAAoIBAQDly93AJQ2GWnXC\nXZPK4yCYPcbiKp688MjVoB8UQ9OOZ7avdq8mm+BygHT85lERk+ICMdv6hLEvvuFj\niDF4c896QOe8i9mm9bVyZReVmV/8HdIGQtxsqYDPduHdL3qyKwomASaP0vTKMKyc\n4/eIPgfrXRBGTJindEMGOQBT0cqnJmwcd/pyW+Ixphx06ReQ52YWksB1bfbLk20t\nxCdfxpPnd3vcNS/KDte9xQVyd6JyJLw+DbYy5EO3XTwD8SpSmwaAmHbBM1wYxp9j\n6QK9c+BzQ3PO05lSo3V3ElzGY58dKqsfo62BVLnpRYpHfa+yguAqZxLENxlpmfJD\naEOJmE5pAgMBAAECggEALiL+RKOr0Xu8BOgQ0j1DwA03LxVrhXe6etmJI+JySTcd\ngKENjWziZVrRIi2DvUm5qMMl7WhSwslKK1eexxZJY7xASqSxcEoIwgz17T07/jxm\nfIdUBiUKDZ1Kv8PWmIr3oKW+fkXWi/m1zlIe0qXRpTmsGNEsHQLEqi0rmaiXTXOR\n/2Ldwi6kZR3sWFx97YS4Mx/pueGJTXEai6AVEZzN5Gog6xD8HXR1Rvq+hhd+MocG\nfnU4HgilKRfoJlWd9FOscgSufKG0L3ViO4fSKU46l5aullDYUk5ECMWiwuKSqSE7\nqD45jI3mbOre7S4u3S3TWdD3lzwiXL49LdwKlEC4mQKBgQD0sLr0GH4Wr+QX2xJE\nuA/Cb8QW41l8iSCBTRZZR/sJOd+o3rbcVidlzO/EbZblXG4ZPDmRjgBCGKIP5EZi\n0DsL+Wv32WOo44LpxJGhqExbm0H1iZ1zZ97l0P8fvIhHE42gmaLToOIGDhPSXGvv\nzlqOHbGbq4jsERc1jp1bej5q6wKBgQDwaueIc4pRchH98QYidcyr8Vwg9KhbnfYX\ny3W4RPlZtBdF34iJaio+ASzugo/zy1RTcVrsCskYWXyKDUQz1yu0iCng+fDCUnTm\nXGmEoEGNhk4vTJOt7hBav1/Ja/dUipGf6mXUuanwJ0e+1/Et/B0ah5X1Um5AyNZI\nM+SyRz3u+wKBgQCjvtUNXoqaghCBCmB6TjZ1prexnWkYFugCv2SSUMIk1W7gIlJ6\ntsjcrj1R1Qii6qzfBFd+GWoA0V06h0e2/qRVCg//p6GytrW33IycgvS+ZPLJ7tLI\nFR2r66WfRlpoPiSL8eRt/P7kkG0hXCn7K7ub2TEu/Ka/W1yNwad6PR8iCwKBgQC8\nXcZSrtQsxAc8w99emJVoEo9wcsCGJ9ltA0iUu9XyZpvlbyJ3J+s48YrWxQ0sop7L\nUgE+96Rfo51kPMi3JVtk81p8ntf4KMrWwokaFMXHsPcJMCJ1IBVIRLE0C5eZcYhv\nlyN57I4tT1lzOZYJxYK4Cot/zrn7oF/j6mTBGfh4iQKBgQCiJMUxRz01/czH/XSX\ngo3dVbHQ4FEOufWnE3Eb93S8r0/eq1RM118rb0TqzuiadW2xYDU4nucWQlrlmq0d\nFY/m+Hy97pqyk6jmoU5I/D+ssBIoYHWLnH9/xfvDEk2JGSJSHtzu0D4EDC/rgQ49\nMbYsO5oUrF8tPlhj5vzbf3GKLA==\n-----END PRIVATE KEY-----\n"

### wopi.publicKeyOld

Defines the old public key that the integrator used to check the private key.

Type: string

Example: "BgIAAACkAABSU0ExAAgAAAEAAQBpTpiJQ2hD8plpGTfEEmcq4IKyr31HikXpuVSBraMfqyodn2PGXBJ3daNSmdPOc0Nz4HO9Auljn8YYXDPBdpiABptSKvEDPF23Q+Qytg0+vCRyondyBcW91w7KLzXce3fnk8ZfJ8QtbZPL9m11wJIWZueQF+l0HKYx4lty+nccbCanytFTADkGQ3SnmExGEF3rBz6I9+OcrDDK9NKPJgEmCiuyei/d4XbPgKls3EIG0h38X5mVF2VytfWm2Yu850B6z3N4MYhj4b4vsYT62zEC4pMRUeb8dIBy4Jsmr3avtmeO00MUH6DVyPC8nirixj2YIOPKk13CdVqGDSXA3cvl"

### wopi.modulusOld

Defines the old RSA modulus in the Base64-encoded format that was used to retrieve the public key.

Type: string

Example: "5cvdwCUNhlp1wl2TyuMgmD3G4iqevPDI1aAfFEPTjme2r3avJpvgcoB0/OZREZPiAjHb+oSxL77hY4gxeHPPekDnvIvZpvW1cmUXlZlf/B3SBkLcbKmAz3bh3S96sisKJgEmj9L0yjCsnOP3iD4H610QRkyYp3RDBjkAU9HKpyZsHHf6clviMaYcdOkXkOdmFpLAdW32y5NtLcQnX8aT53d73DUvyg7XvcUFcneiciS8Pg22MuRDt108A/EqUpsGgJh2wTNcGMafY+kCvXPgc0NzztOZUqN1dxJcxmOfHSqrH6OtgVS56UWKR32vsoLgKmcSxDcZaZnyQ2hDiZhOaQ=="

### wopi.exponentOld

Defines the old RSA exponent in the Base64-encoded format that was used to retrieve the public key.

Type: string

Example: "65537"

### wopi.privateKeyOld

Defines the old private key that signed the document server request.

Type: string

Example: "-----BEGIN PRIVATE KEY-----\nMIIEvwIBADANBgkqhkiG9w0BAQEFAASCBKkwggSlAgEAAoIBAQDly93AJQ2GWnXC\nXZPK4yCYPcbiKp688MjVoB8UQ9OOZ7avdq8mm+BygHT85lERk+ICMdv6hLEvvuFj\niDF4c896QOe8i9mm9bVyZReVmV/8HdIGQtxsqYDPduHdL3qyKwomASaP0vTKMKyc\n4/eIPgfrXRBGTJindEMGOQBT0cqnJmwcd/pyW+Ixphx06ReQ52YWksB1bfbLk20t\nxCdfxpPnd3vcNS/KDte9xQVyd6JyJLw+DbYy5EO3XTwD8SpSmwaAmHbBM1wYxp9j\n6QK9c+BzQ3PO05lSo3V3ElzGY58dKqsfo62BVLnpRYpHfa+yguAqZxLENxlpmfJD\naEOJmE5pAgMBAAECggEALiL+RKOr0Xu8BOgQ0j1DwA03LxVrhXe6etmJI+JySTcd\ngKENjWziZVrRIi2DvUm5qMMl7WhSwslKK1eexxZJY7xASqSxcEoIwgz17T07/jxm\nfIdUBiUKDZ1Kv8PWmIr3oKW+fkXWi/m1zlIe0qXRpTmsGNEsHQLEqi0rmaiXTXOR\n/2Ldwi6kZR3sWFx97YS4Mx/pueGJTXEai6AVEZzN5Gog6xD8HXR1Rvq+hhd+MocG\nfnU4HgilKRfoJlWd9FOscgSufKG0L3ViO4fSKU46l5aullDYUk5ECMWiwuKSqSE7\nqD45jI3mbOre7S4u3S3TWdD3lzwiXL49LdwKlEC4mQKBgQD0sLr0GH4Wr+QX2xJE\nuA/Cb8QW41l8iSCBTRZZR/sJOd+o3rbcVidlzO/EbZblXG4ZPDmRjgBCGKIP5EZi\n0DsL+Wv32WOo44LpxJGhqExbm0H1iZ1zZ97l0P8fvIhHE42gmaLToOIGDhPSXGvv\nzlqOHbGbq4jsERc1jp1bej5q6wKBgQDwaueIc4pRchH98QYidcyr8Vwg9KhbnfYX\ny3W4RPlZtBdF34iJaio+ASzugo/zy1RTcVrsCskYWXyKDUQz1yu0iCng+fDCUnTm\nXGmEoEGNhk4vTJOt7hBav1/Ja/dUipGf6mXUuanwJ0e+1/Et/B0ah5X1Um5AyNZI\nM+SyRz3u+wKBgQCjvtUNXoqaghCBCmB6TjZ1prexnWkYFugCv2SSUMIk1W7gIlJ6\ntsjcrj1R1Qii6qzfBFd+GWoA0V06h0e2/qRVCg//p6GytrW33IycgvS+ZPLJ7tLI\nFR2r66WfRlpoPiSL8eRt/P7kkG0hXCn7K7ub2TEu/Ka/W1yNwad6PR8iCwKBgQC8\nXcZSrtQsxAc8w99emJVoEo9wcsCGJ9ltA0iUu9XyZpvlbyJ3J+s48YrWxQ0sop7L\nUgE+96Rfo51kPMi3JVtk81p8ntf4KMrWwokaFMXHsPcJMCJ1IBVIRLE0C5eZcYhv\nlyN57I4tT1lzOZYJxYK4Cot/zrn7oF/j6mTBGfh4iQKBgQCiJMUxRz01/czH/XSX\ngo3dVbHQ4FEOufWnE3Eb93S8r0/eq1RM118rb0TqzuiadW2xYDU4nucWQlrlmq0d\nFY/m+Hy97pqyk6jmoU5I/D+ssBIoYHWLnH9/xfvDEk2JGSJSHtzu0D4EDC/rgQ49\nMbYsO5oUrF8tPlhj5vzbf3GKLA==\n-----END PRIVATE KEY-----\n"

### wopi.refreshLockInterval

Defines the interval time in minutes for refreshing the lock on a file by resetting its automatic expiration timer to 30 minutes.

Type: string

Example: "10m"

### wopi.dummy

Defines the properties of dummy handlers for stress testing.

Type: object

Example:

``` json
{
  "enable": false,
  "sampleFilePath": ""
}
```

### wopi.dummy.enable

Defines if the dummy handlers are enabled or not.

Type: boolean

Example: false

### wopi.dummy.sampleFilePath

Defines the dummy path to the sample file.

Type: string

Example: ""

## Example

``` json
{
  "wopi": {
    "enable": false,
    "host": "",
    "htmlTemplate": "../../web-apps/apps/api/wopi",
    "wopiZone": "external-http",
    "favIconUrlWord": "/web-apps/apps/documenteditor/main/resources/img/favicon.ico",
    "favIconUrlCell": "/web-apps/apps/spreadsheeteditor/main/resources/img/favicon.ico",
    "favIconUrlSlide": "/web-apps/apps/presentationeditor/main/resources/img/favicon.ico",
    "favIconUrlPdf": "/web-apps/apps/pdfeditor/main/resources/img/favicon.ico",
    "fileInfoBlockList": ["FileUrl"],
    "pdfView": ["djvu", "xps", "oxps"],
    "pdfEdit": ["pdf"],
    "forms": ["pdf"],
    "wordView": ["doc", "dotm", "dot", "fodt", "ott", "rtf", "mht", "mhtml", "html", "htm", "xml", "epub", "fb2", "sxw", "stw", "wps", "wpt", "docxf", "oform"],
    "wordEdit": ["docx", "dotx", "docm", "odt", "txt"],
    "cellView": ["xls", "xlsb", "xltm", "xlt", "fods", "ots", "sxc", "xml", "et", "ett"],
    "cellEdit": ["xlsx", "xltx", "xlsm", "ods", "csv"],
    "slideView": ["ppt", "ppsx", "ppsm", "pps", "potm", "pot", "fodp", "otp", "sxi", "dps", "dpt"],
    "slideEdit": ["pptx", "potx", "pptm", "odp"],
    "publicKey": "BgIAAACkAABSU0ExAAgAAAEAAQBpTpiJQ2hD8plpGTfEEmcq4IKyr31HikXpuVSBraMfqyodn2PGXBJ3daNSmdPOc0Nz4HO9Auljn8YYXDPBdpiABptSKvEDPF23Q+Qytg0+vCRyondyBcW91w7KLzXce3fnk8ZfJ8QtbZPL9m11wJIWZueQF+l0HKYx4lty+nccbCanytFTADkGQ3SnmExGEF3rBz6I9+OcrDDK9NKPJgEmCiuyei/d4XbPgKls3EIG0h38X5mVF2VytfWm2Yu850B6z3N4MYhj4b4vsYT62zEC4pMRUeb8dIBy4Jsmr3avtmeO00MUH6DVyPC8nirixj2YIOPKk13CdVqGDSXA3cvl",
    "modulus": "5cvdwCUNhlp1wl2TyuMgmD3G4iqevPDI1aAfFEPTjme2r3avJpvgcoB0/OZREZPiAjHb+oSxL77hY4gxeHPPekDnvIvZpvW1cmUXlZlf/B3SBkLcbKmAz3bh3S96sisKJgEmj9L0yjCsnOP3iD4H610QRkyYp3RDBjkAU9HKpyZsHHf6clviMaYcdOkXkOdmFpLAdW32y5NtLcQnX8aT53d73DUvyg7XvcUFcneiciS8Pg22MuRDt108A/EqUpsGgJh2wTNcGMafY+kCvXPgc0NzztOZUqN1dxJcxmOfHSqrH6OtgVS56UWKR32vsoLgKmcSxDcZaZnyQ2hDiZhOaQ==",
    "exponent": "65537",
    "privateKey": "-----BEGIN PRIVATE KEY-----\nMIIEvwIBADANBgkqhkiG9w0BAQEFAASCBKkwggSlAgEAAoIBAQDly93AJQ2GWnXC\nXZPK4yCYPcbiKp688MjVoB8UQ9OOZ7avdq8mm+BygHT85lERk+ICMdv6hLEvvuFj\niDF4c896QOe8i9mm9bVyZReVmV/8HdIGQtxsqYDPduHdL3qyKwomASaP0vTKMKyc\n4/eIPgfrXRBGTJindEMGOQBT0cqnJmwcd/pyW+Ixphx06ReQ52YWksB1bfbLk20t\nxCdfxpPnd3vcNS/KDte9xQVyd6JyJLw+DbYy5EO3XTwD8SpSmwaAmHbBM1wYxp9j\n6QK9c+BzQ3PO05lSo3V3ElzGY58dKqsfo62BVLnpRYpHfa+yguAqZxLENxlpmfJD\naEOJmE5pAgMBAAECggEALiL+RKOr0Xu8BOgQ0j1DwA03LxVrhXe6etmJI+JySTcd\ngKENjWziZVrRIi2DvUm5qMMl7WhSwslKK1eexxZJY7xASqSxcEoIwgz17T07/jxm\nfIdUBiUKDZ1Kv8PWmIr3oKW+fkXWi/m1zlIe0qXRpTmsGNEsHQLEqi0rmaiXTXOR\n/2Ldwi6kZR3sWFx97YS4Mx/pueGJTXEai6AVEZzN5Gog6xD8HXR1Rvq+hhd+MocG\nfnU4HgilKRfoJlWd9FOscgSufKG0L3ViO4fSKU46l5aullDYUk5ECMWiwuKSqSE7\nqD45jI3mbOre7S4u3S3TWdD3lzwiXL49LdwKlEC4mQKBgQD0sLr0GH4Wr+QX2xJE\nuA/Cb8QW41l8iSCBTRZZR/sJOd+o3rbcVidlzO/EbZblXG4ZPDmRjgBCGKIP5EZi\n0DsL+Wv32WOo44LpxJGhqExbm0H1iZ1zZ97l0P8fvIhHE42gmaLToOIGDhPSXGvv\nzlqOHbGbq4jsERc1jp1bej5q6wKBgQDwaueIc4pRchH98QYidcyr8Vwg9KhbnfYX\ny3W4RPlZtBdF34iJaio+ASzugo/zy1RTcVrsCskYWXyKDUQz1yu0iCng+fDCUnTm\nXGmEoEGNhk4vTJOt7hBav1/Ja/dUipGf6mXUuanwJ0e+1/Et/B0ah5X1Um5AyNZI\nM+SyRz3u+wKBgQCjvtUNXoqaghCBCmB6TjZ1prexnWkYFugCv2SSUMIk1W7gIlJ6\ntsjcrj1R1Qii6qzfBFd+GWoA0V06h0e2/qRVCg//p6GytrW33IycgvS+ZPLJ7tLI\nFR2r66WfRlpoPiSL8eRt/P7kkG0hXCn7K7ub2TEu/Ka/W1yNwad6PR8iCwKBgQC8\nXcZSrtQsxAc8w99emJVoEo9wcsCGJ9ltA0iUu9XyZpvlbyJ3J+s48YrWxQ0sop7L\nUgE+96Rfo51kPMi3JVtk81p8ntf4KMrWwokaFMXHsPcJMCJ1IBVIRLE0C5eZcYhv\nlyN57I4tT1lzOZYJxYK4Cot/zrn7oF/j6mTBGfh4iQKBgQCiJMUxRz01/czH/XSX\ngo3dVbHQ4FEOufWnE3Eb93S8r0/eq1RM118rb0TqzuiadW2xYDU4nucWQlrlmq0d\nFY/m+Hy97pqyk6jmoU5I/D+ssBIoYHWLnH9/xfvDEk2JGSJSHtzu0D4EDC/rgQ49\nMbYsO5oUrF8tPlhj5vzbf3GKLA==\n-----END PRIVATE KEY-----\n",
    "publicKeyOld": "BgIAAACkAABSU0ExAAgAAAEAAQBpTpiJQ2hD8plpGTfEEmcq4IKyr31HikXpuVSBraMfqyodn2PGXBJ3daNSmdPOc0Nz4HO9Auljn8YYXDPBdpiABptSKvEDPF23Q+Qytg0+vCRyondyBcW91w7KLzXce3fnk8ZfJ8QtbZPL9m11wJIWZueQF+l0HKYx4lty+nccbCanytFTADkGQ3SnmExGEF3rBz6I9+OcrDDK9NKPJgEmCiuyei/d4XbPgKls3EIG0h38X5mVF2VytfWm2Yu850B6z3N4MYhj4b4vsYT62zEC4pMRUeb8dIBy4Jsmr3avtmeO00MUH6DVyPC8nirixj2YIOPKk13CdVqGDSXA3cvl",
    "modulusOld": "5cvdwCUNhlp1wl2TyuMgmD3G4iqevPDI1aAfFEPTjme2r3avJpvgcoB0/OZREZPiAjHb+oSxL77hY4gxeHPPekDnvIvZpvW1cmUXlZlf/B3SBkLcbKmAz3bh3S96sisKJgEmj9L0yjCsnOP3iD4H610QRkyYp3RDBjkAU9HKpyZsHHf6clviMaYcdOkXkOdmFpLAdW32y5NtLcQnX8aT53d73DUvyg7XvcUFcneiciS8Pg22MuRDt108A/EqUpsGgJh2wTNcGMafY+kCvXPgc0NzztOZUqN1dxJcxmOfHSqrH6OtgVS56UWKR32vsoLgKmcSxDcZaZnyQ2hDiZhOaQ==",
    "exponentOld": "65537",
    "privateKeyOld": "-----BEGIN PRIVATE KEY-----\nMIIEvwIBADANBgkqhkiG9w0BAQEFAASCBKkwggSlAgEAAoIBAQDly93AJQ2GWnXC\nXZPK4yCYPcbiKp688MjVoB8UQ9OOZ7avdq8mm+BygHT85lERk+ICMdv6hLEvvuFj\niDF4c896QOe8i9mm9bVyZReVmV/8HdIGQtxsqYDPduHdL3qyKwomASaP0vTKMKyc\n4/eIPgfrXRBGTJindEMGOQBT0cqnJmwcd/pyW+Ixphx06ReQ52YWksB1bfbLk20t\nxCdfxpPnd3vcNS/KDte9xQVyd6JyJLw+DbYy5EO3XTwD8SpSmwaAmHbBM1wYxp9j\n6QK9c+BzQ3PO05lSo3V3ElzGY58dKqsfo62BVLnpRYpHfa+yguAqZxLENxlpmfJD\naEOJmE5pAgMBAAECggEALiL+RKOr0Xu8BOgQ0j1DwA03LxVrhXe6etmJI+JySTcd\ngKENjWziZVrRIi2DvUm5qMMl7WhSwslKK1eexxZJY7xASqSxcEoIwgz17T07/jxm\nfIdUBiUKDZ1Kv8PWmIr3oKW+fkXWi/m1zlIe0qXRpTmsGNEsHQLEqi0rmaiXTXOR\n/2Ldwi6kZR3sWFx97YS4Mx/pueGJTXEai6AVEZzN5Gog6xD8HXR1Rvq+hhd+MocG\nfnU4HgilKRfoJlWd9FOscgSufKG0L3ViO4fSKU46l5aullDYUk5ECMWiwuKSqSE7\nqD45jI3mbOre7S4u3S3TWdD3lzwiXL49LdwKlEC4mQKBgQD0sLr0GH4Wr+QX2xJE\nuA/Cb8QW41l8iSCBTRZZR/sJOd+o3rbcVidlzO/EbZblXG4ZPDmRjgBCGKIP5EZi\n0DsL+Wv32WOo44LpxJGhqExbm0H1iZ1zZ97l0P8fvIhHE42gmaLToOIGDhPSXGvv\nzlqOHbGbq4jsERc1jp1bej5q6wKBgQDwaueIc4pRchH98QYidcyr8Vwg9KhbnfYX\ny3W4RPlZtBdF34iJaio+ASzugo/zy1RTcVrsCskYWXyKDUQz1yu0iCng+fDCUnTm\nXGmEoEGNhk4vTJOt7hBav1/Ja/dUipGf6mXUuanwJ0e+1/Et/B0ah5X1Um5AyNZI\nM+SyRz3u+wKBgQCjvtUNXoqaghCBCmB6TjZ1prexnWkYFugCv2SSUMIk1W7gIlJ6\ntsjcrj1R1Qii6qzfBFd+GWoA0V06h0e2/qRVCg//p6GytrW33IycgvS+ZPLJ7tLI\nFR2r66WfRlpoPiSL8eRt/P7kkG0hXCn7K7ub2TEu/Ka/W1yNwad6PR8iCwKBgQC8\nXcZSrtQsxAc8w99emJVoEo9wcsCGJ9ltA0iUu9XyZpvlbyJ3J+s48YrWxQ0sop7L\nUgE+96Rfo51kPMi3JVtk81p8ntf4KMrWwokaFMXHsPcJMCJ1IBVIRLE0C5eZcYhv\nlyN57I4tT1lzOZYJxYK4Cot/zrn7oF/j6mTBGfh4iQKBgQCiJMUxRz01/czH/XSX\ngo3dVbHQ4FEOufWnE3Eb93S8r0/eq1RM118rb0TqzuiadW2xYDU4nucWQlrlmq0d\nFY/m+Hy97pqyk6jmoU5I/D+ssBIoYHWLnH9/xfvDEk2JGSJSHtzu0D4EDC/rgQ49\nMbYsO5oUrF8tPlhj5vzbf3GKLA==\n-----END PRIVATE KEY-----\n",
    "refreshLockInterval": "10m",
    "dummy": {
      "enable": false,
      "sampleFilePath": ""
    }
  }
}
```
