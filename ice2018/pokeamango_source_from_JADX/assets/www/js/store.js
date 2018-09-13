function stopCamera() {
    cordova.plugins.camerapreview.stopCamera();
}

function updateMangoCount(){
  payload = {
    "uuid": device.uuid
  };

  $.post("http://pokeamango.vuln.icec.tf/mango/count", payload, function(data){
    $("#mango-count").text(data["count"]);
  });
}

document.addEventListener('deviceready', function(){
    updateMangoCount();
  stopCamera();
}, false);

$("#buyFlag").click(function(event){
  payload = {
    "uuid": device.uuid
  };
  $.post("http://pokeamango.vuln.icec.tf/store/flag", payload, function(data){
    window.plugins.toast.showLongBottom(data["message"], function(a){console.log('toast success: ' + a)}, function(b){alert('toast error: ' + b)})
  });
});
