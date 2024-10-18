Plugin variations - subplugins that are created inside the origin plugin for the following purposes:

- to perform the main plugin actions;
- to contain plugin settings;
- to display an **About** window, etc.

Starting from version 8.1, plugins can create multiple plugin panels.

Let’s have a look at the **Speech** plugin. The plugin itself does not need a visual window for converting the selected text into speech as it can be done just pressing a single button, but its settings (the speech language, rate and pitch) and an **About** window must be visual. So we will need to have at least two plugin variations (text conversion itself and settings), or three, in case we want to add an **About** window with the information about the plugin and its authors or the software used for the plugin creation.

![Insisible plugin](/assets/images/plugins/invisible-plugin.png)
![Speech settings](/assets/images/plugins/speech-settings.png)

To create plugin variations, you need to specify its parameters in the [config.json](../index.md#variations) file and build the [index.html](../../Entry%20point/index.md) files for each variation.

> The *.html* files for **all** variations must be placed to the plugin root folder together with the *config.json* configuration file for the plugin to work correctly.
