---
order: -6
---

To restrict public access to your data, a secure exchange of requests between an online office and an integrator must be configured.

The integrator must check that the request is received from ONLYOFFICE Docs. It uses [proof keys](https://docs.microsoft.com/en-us/microsoft-365/cloud-storage-partner-program/online/scenarios/proofkeys) for this purpose. ONLYOFFICE Docs signs the request with a private key. The corresponding public key is written in the proof-key element in the [WOPI discovery XML](../WOPI%20discovery/index.md). The integrator checks the private key with the public key. The signature is sent with every request in the **X-WOPI-Proof** and **X-WOPI-ProofOld** HTTP headers. Private and public keys are set up via the following config parameters:

## Parameters

| Name            | Type   | Example               | Description                                                                                    |
| --------------- | ------ | --------------------- | ---------------------------------------------------------------------------------------------- |
| wopi.publicKey  | string | "public key example"  | Defines the public key that the integrator uses to check the private key.                      |
| wopi.modulus    | string | "modulus example"     | Defines the RSA modulus in the Base64-encoded format that is used to retrieve the public key.  |
| wopi.exponent   | string | "AQAB"                | Defines the RSA exponent in the Base64-encoded format that is used to retrieve the public key. |
| wopi.privateKey | string | "private key example" | Defines the private key that signs the ONLYOFFICE Docs request.                                |

## Example

``` json
{
  "wopi": {
    "publicKey": "public key example",
    "modulus": "modulus example",
    "exponent": "AQAB",
    "privateKey": "private key example"
  }
}
```

> By default, proof keys are already set. They are not generated, i.e. the same keys are used for all installations.
