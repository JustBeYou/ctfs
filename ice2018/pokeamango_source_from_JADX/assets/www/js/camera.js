var app = {
  init: function(){
    cordova.plugins.camerapreview.setOnPictureTakenHandler(function(result){
      document.getElementById('camera').src = result[0];
    });

    cordova.plugins.camerapreview.startCamera({
      x: 0,
      y: 0,
      width: $(window).width(),
      height: $(window).height()
    }, "back", true, true, true);
  }
};

document.addEventListener('deviceready', function(){
  app.init();
}, false);
