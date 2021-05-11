# publicera-theme-ojs-plugin
OJS theme plugin for "Publicera".

## Support

This plugin is developed and tested with the following setup:
* `OJS 3.3.0-3`
* `PHP 7.4`

## Requirements
* [node.js](http://nodejs.org/)
* [npm](https://www.npmjs.com/get-npm) (should already be included with node)

## Usage
The theme needs to be built before it is uploaded or deployed to OJS. The `build` folder will contain the finished theme-folder that should be moved into `<ojs_root>/plugins/themes/`. See [build](#build).

## Build

````
$ npm install
````

````
$ npm run build
````

## Development

It's adviced to keep this repository out of your OJS installation. Instead, create a symlink in your `<ojs_root>/plugins/themes/` that points a symlinked folder named `publicera_theme` to `<this_repo>/build/publicera_theme/`.