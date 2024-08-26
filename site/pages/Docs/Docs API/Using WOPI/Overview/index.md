---
order: -9
---

Starting from version 6.4, ONLYOFFICE Docs offers support for the **Web Application Open Platform Interface Protocol (WOPI)** - a REST-based protocol that is used to integrate your application with an online office. WOPI operations allow you to open files stored on a server, edit and save them.

This documentation describes:

- file properties that can be specified via [WOPI discovery](../WOPI%20discovery/index.md);
- a [host page](../Host%20page/index.md) that must be built to create an iframe element within the online office;
- [proof keys](../Proof%20keys/index.md) which are used to check that the request is received from the online office;
- supported [WOPI REST API](../WOPI%20REST%20API/index.md) functions;
- available messages that can be posted via [PostMessage](../PostMessage/index.md);
- request parameters for [converting](../Conversion%20API/index.md) different file formats in the online office;
- a scheme for [editing binary document formats](../Editing%20binary%20documents/index.md);
- [differences](../API%20vs%20WOPI/index.md) between ONLYOFFICE Docs API and WOPI.

For further information on the WOPI protocol, please read the [WOPI documentation](https://docs.microsoft.com/en-us/microsoft-365/cloud-storage-partner-program/online/).

All the necessary [WOPI settings](https://helpcenter.onlyoffice.com/installation/docs-developer-configuring.aspx#WOPI) you can find and change in the configuration file which can be found (or created) at the following path:

For Linux - */etc/onlyoffice/documentserver/**local.json***.

For Windows - *%ProgramFiles%\ONLYOFFICE\DocumentServer\config\\**local.json***.

> The default values are available in the *default.json* configuration file, which is available in the folders above (for Linux and Windows). Please do not edit the contents of the *default.json* file directly. The default values will be restored each time you restart Docker container or upgrade **ONLYOFFICE Docs** to a new version and all your changes will be lost.

## Enabling WOPI

To enable WOPI, set the [wopi.enable](https://helpcenter.onlyoffice.com/installation/docs-developer-configuring.aspx#wopi-enable) parameter in the ONLYOFFICE Docs config to **true**:

### Parameters

| Name        | Description                                                        | Type    | Example |
| ----------- | ------------------------------------------------------------------ | ------- | ------- |
| wopi.enable | Defines if WOPI is enabled or not. The default value is **false**. | boolean | true    |

### Example

``` json
{
  "wopi": {
    "enable": true
  }
}
```

## IP filter

ONLYOFFICE Docs can accept WOPI requests only from the trusted integrator. The IP address of such an integrator must be included in the [WOPI domain allow list](https://docs.microsoft.com/en-us/microsoft-365/cloud-storage-partner-program/online/build-test-ship/settings#wopi-domain-allow-list). At the same time, access for all the other integrators must be denied.

> By default, all the IP addresses are considered trusted.

Follow the steps below to configure the ONLYOFFICE Docs [IP filter](https://helpcenter.onlyoffice.com/installation/docs-developer-configuring.aspx#IPFilter):

1. Open the */etc/onlyoffice/documentserver/local.json* file using any available text editor:

   ``` json
   {
     "ipfilter": {
       "rules": [
         {
           "address": "ip_address",
           "allowed": true
         },
         {
           "address": "*",
           "allowed": false
         }
       ],
       "useforrequest": false,
       "errorcode": 403
     }
   }
  
   ```

2. Change the following default settings. Enter your *"ip\_address"* that can contain:

   - IP in the X.X.X.X format for ipv4,
   - IP in the xxxx.xxxx.xxxx.xxxx.xxxx.xxxx.xxxx.xxxx format for ipv6,
   - dns-name,
   - \* wildcard to replace any symbol/symbols.

3. Change the *"allowed"* rule that can be **true** or **false**.

4. Restart the services for the config changes to take effect:

   **For RPM/DEB packages:**

   ``` sh
   systemctl restart ds-*
   ```

   **For Docker:**

   ``` sh
   supervisorctl restart all
   ```

## WOPISrc

Starting from version 8.0, the WOPISrc query parameter is added to the requests from the browser to the server. This allows you to create several independent instances of ONLYOFFICE. Load balancing requests with WOPISrc ensure that collaborative editing works correctly: all users editing the same document are served by the same server.

For WOPI, the parameter sent by the integrator is used. For Docs API, the [shardkey](../../Get%20Started/How%20It%20Works/index.md#shard-key) parameter is used.
