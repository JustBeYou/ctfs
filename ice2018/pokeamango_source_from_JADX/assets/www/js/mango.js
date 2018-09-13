var pokes = 0;
var pokeGoals = Math.random() * (8 - 4) + 4;;

var currentPosLat = 0;
var currentPosLng = 0;
var mangoPosLat = 0;
var mangoPosLng = 0;

$("#mango").click(function(e){
  pokes++;
  if(pokes >= pokeGoals)
    catchMango();
});

function catchMango() {
  var payload = {
    "curLat": currentPosLat,
    "curLong": currentPosLng,
    "mangoLat": mangoPosLat,
    "mangoLong": mangoPosLng,
    "uuid": device.uuid
  };

    $.post("http://pokeamango.vuln.icec.tf/mango/catch", payload, function(results){

    window.plugins.toast.showLongBottom(results["message"], function(a){console.log('toast success: ' + a)}, function(b){alert('toast error: ' + b)})
    $("#mango").removeClass("bounce infinite");
    $("#mango").addClass("bounceOutRight");
    setTimeout(function(){ window.location.href = "map.html"; }, 1000);
  });
};

$('#mango').one('webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend', function(){
  $("#mango").removeClass("bounceInDown");
  $("#mango").addClass("bounce infinite");
});

document.addEventListener('deviceready', function(){
  window.plugins.toast.showLongBottom('Poke the mango!', function(a){console.log('toast success: ' + a)}, function(b){alert('toast error: ' + b)})
}, false);

var pos = window.name.split(",");
currentPosLat = pos[0];
currentPosLng = pos[1];
mangoPosLat = pos[2];
mangoPosLng = pos[3];
