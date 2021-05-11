# publicera-theme-ojs-plugin
OJS theme plugin for "Publicera".

## Support

This plugin is developed and tested with the following setup:
* `OJS 3.3.0-3`
* `PHP 7.4`

## Requirements
* [node.js](http://nodejs.org/)
* [npm](https://www.npmjs.com/get-npm) (should already be included with node)
* Sass

## Usage

1. [Build the theme](#Build).
2. Copy the contents of the `build` folder (a folder named `publicera_theme`).
3. Move the copy to your OJS themes folder `<ojs_root>/plugins/themes/`, OR just upload it inside the software as a theme plugin.


## Development

It's adviced to keep this repository out of your OJS development environment while developing the plugin. Instead, create a symlink in your `<ojs_root>/plugins/themes/` that points a symlinked folder named `publicera_theme` to `<this_repo>/build/publicera_theme/`.

## Build

````
$ npm install
````

````
$ npm run build
````