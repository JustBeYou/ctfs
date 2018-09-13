var map = undefined;
var currentPos = undefined;
var mangos = [];
var uuid = "";

function initMap() {

  if(currentPos === undefined)
    currentPos = new google.maps.LatLng(0, 0);
  map = new google.maps.Map(document.getElementById('map'), {
    center: currentPos,
    zoom: 15
  });
}

var updateMap = function() {
  console.log("updating map");
  map.setCenter(currentPos);

  // Clear mangos
  for (var i = 0; i < mangos.length; i++) {
    mangos[i].setMap(null);
  }
  mangos = [];

  var user = new google.maps.Marker({
    position: currentPos,
    map: map,
    icon: 'img/user_marker.png'
  });

  // You're my favorite mango
  mangos.push(user);

  var payload = {
    lat: currentPos.lat,
    long: currentPos.lng
  }

  payload["uuid"] = uuid

  $.post("http://pokeamango.vuln.icec.tf/mango/list", payload, function(results){
    var data = results["mangos"];
    for (var i = 0; i < data.length; i++) {
      var place = data[i];

      var mango = new google.maps.Marker({
        position: place,
        map: map,
        icon: 'img/mangie_marker.png'
      });

      mangos.push(mango);

      mango.addListener('click', function(event){
        window.name = (currentPos.lat()) + "," + (currentPos.lng()) + "," + (this.getPosition().lat()) + "," + (this.getPosition().lng());
        window.location.href = "camera.html";
      });
    }
  });
};

// setCurrentPos Callback
// This method accepts a Position object, which contains the
// current GPS coordinates
//
var setCurrentPos = function(position) {
  currentPos = new google.maps.LatLng(position.coords.latitude, position.coords.longitude);
  updateMap();
};

// onError Callback receives a PositionError object
//
function onError(error) {
    alert('code: '    + error.code    + '\n' +
          'message: ' + error.message + '\n');
}

function stopCamera() {
    cordova.plugins.camerapreview.stopCamera();
}

document.addEventListener('deviceready', function(){
  stopCamera();
  uuid = device.uuid;

  navigator.geolocation.getCurrentPosition(setCurrentPos, onError);

  window.setInterval(function(){
      navigator.geolocation.getCurrentPosition(setCurrentPos, onError);
  }, 10000);
}, false);
