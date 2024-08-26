---
order: -7
---

[ONLYOFFICE Docs](https://www.onlyoffice.com/download-docs.aspx?from=api#docs-developer) is available for Windows, Linux and Docker.

To install it on your local server, follow the instructions in **ONLYOFFICE Help Center**:

- [](https://helpcenter.onlyoffice.com/installation/docs-developer-install-windows.aspx?from=api)

  [Get ONLYOFFICE Docs for Windows](https://helpcenter.onlyoffice.com/installation/docs-developer-install-windows.aspx?from=api)

- [](https://helpcenter.onlyoffice.com/installation/docs-developer-install-ubuntu.aspx?from=api)

  [Get ONLYOFFICE Docs for Linux](https://helpcenter.onlyoffice.com/installation/docs-developer-install-ubuntu.aspx?from=api)

- [](https://helpcenter.onlyoffice.com/installation/docs-developer-install-docker.aspx?from=api)

  [Get ONLYOFFICE Docs for Docker](https://helpcenter.onlyoffice.com/installation/docs-developer-install-docker.aspx?from=api)

Before working with ONLYOFFICE Docs API documentation, it is recommended to make the following settings if necessary:

- configure [ONLYOFFICE Docs server settings](https://helpcenter.onlyoffice.com/installation/docs-developer-configuring.aspx?from=api) in ONLYOFFICE Docs configuration file;
- switch ONLYOFFICE Docs to the HTTPS protocol for secure connection using [SSL Certificates](https://helpcenter.onlyoffice.com/installation/docs-community-https-linux.aspx?from=api);
- add additional [fonts](https://helpcenter.onlyoffice.com/installation/docs-community-install-fonts-linux.aspx?from=api) to ONLYOFFICE Docs to enhance the work with the editors;
- add your own [color themes](https://helpcenter.onlyoffice.com/installation/docs-developer-change-theme.aspx?from=api) for the application interface.

## Health check

To check if the editors are available, send the GET request to */healthcheck*. This request checks the availability of the databases, message broker, Redis connection, and storage.

The response must be **true**, which means that the editors are ready to use.

If something went wrong, make sure that you have followed the installation instructions above.
