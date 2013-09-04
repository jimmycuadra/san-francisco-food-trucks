//= require underscore
//= require backbone
//= require core
//= require_tree ./models
//= require_tree ./collections
//= require_tree ./views

// Render the map with the data from the server.
sfft.init = function () {
  this.loadingBar = $(".loading");
  this.search = new sfft.SearchView;
  this.trucks = new sfft.TruckSet;
  this.map = new sfft.MapView({
    collection: this.trucks,
    search: this.search
  });
  this.map.render();
  this.trucks.reset(this.data);
  this.loadingBar.toggleClass("hidden");
};

// Initialize the application when the window loads.
google.maps.event.addDomListener(window, 'load', sfft.init.bind(sfft));
