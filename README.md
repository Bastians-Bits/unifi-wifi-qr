# Unifi Wifi QR

Make joining a network easier by creating a Network QR Code.

# Requirement

The tool is tailor to work with a network managed by a Unifi Controller.

# Configuration

| Name           | Example                            | Description
|----------------|------------------------------------|-------------
| CONTROLLER_URL | mycontroller.net, 192.168.1.3:8443 | The Url or IP address to the controller. Note: The controller has to be reachable using HTTP/S.
| API_KEY        | dahdakjhfalkfsakljf                | The [API Key](https://developer.ui.com/site-manager/v1.0.0/gettingstarted) for you controller.
| WIFI_SID       | Wifi Guest                         | The Name of the Network you want to create a QR Code for.
| SITE           | Default                            | The Site the Wifi Network is part of. Can be left empty if only one site is available.

# Important Paths and Files

__Http Directory__

`/usr/local/apache2/htdocs/` Contains the webpages and QR Code file.

__QR Code__

`qr-code.png` Name of the QR Code file within the _Http Directory_.

# Create your own page!

You can also create your own page by adding `index.html.template` to the _Http Directory_. The QR Code is available using its name loaded from webservers root directory, the runner wil replace `{WIFI-SID}` and `{WIFI-PASSWORD}` with its coresponding values.

# AI Usage

The whole projects and all its bugs have been written without the usage of AI. I don't need help to write bad code.

# Future Features

- Update the Password to a randomized string in set intervals (for example for Guest Networks)
- Tabbed web-page for all Wifis
- Configuration via property file

# Bug Reports and Improvements

The project is tailored for a very specific use-case, i.e. mine, so if you encounter any bugs or problems, please be descriptive with the problem and information (minus sensitiv data).

If you see room for improvement or bad practice, please let me know. I am always eager to improve.
