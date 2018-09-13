cordova.define('cordova/plugin_list', function(require, exports, module) {
module.exports = [
  {
    "id": "com.mbppower.camerapreview.CameraPreview",
    "file": "plugins/com.mbppower.camerapreview/www/CameraPreview.js",
    "pluginId": "com.mbppower.camerapreview",
    "clobbers": [
      "cordova.plugins.camerapreview"
    ]
  },
  {
    "id": "cordova-plugin-device.device",
    "file": "plugins/cordova-plugin-device/www/device.js",
    "pluginId": "cordova-plugin-device",
    "clobbers": [
      "device"
    ]
  },
  {
    "id": "cordova-plugin-x-toast.Toast",
    "file": "plugins/cordova-plugin-x-toast/www/Toast.js",
    "pluginId": "cordova-plugin-x-toast",
    "clobbers": [
      "window.plugins.toast"
    ]
  },
  {
    "id": "cordova-plugin-x-toast.tests",
    "file": "plugins/cordova-plugin-x-toast/test/tests.js",
    "pluginId": "cordova-plugin-x-toast"
  },
  {
    "id": "cordova-plugin-geolocation.geolocation",
    "file": "plugins/cordova-plugin-geolocation/www/android/geolocation.js",
    "pluginId": "cordova-plugin-geolocation",
    "clobbers": [
      "navigator.geolocation"
    ]
  },
  {
    "id": "cordova-plugin-geolocation.PositionError",
    "file": "plugins/cordova-plugin-geolocation/www/PositionError.js",
    "pluginId": "cordova-plugin-geolocation",
    "runs": true
  }
];
module.exports.metadata = 
// TOP OF METADATA
{
  "com.mbppower.camerapreview": "0.0.8",
  "cordova-plugin-device": "1.1.2",
  "cordova-plugin-whitelist": "1.2.2",
  "cordova-plugin-x-toast": "2.5.2",
  "cordova-plugin-geolocation": "2.2.0"
};
// BOTTOM OF METADATA
});