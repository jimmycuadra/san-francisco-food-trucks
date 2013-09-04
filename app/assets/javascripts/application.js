//= require underscore
//= require backbone
//= require core
//= require_tree ./models
//= require_tree ./collections
//= require_tree ./views

sfft.init = function () {
  this.trucks = new sfft.TruckSet(sfft.data);
}

google.maps.event.addDomListener(window, 'load', sfft.init);
