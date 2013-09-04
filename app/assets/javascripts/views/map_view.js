sfft.MapView = Backbone.View.extend({
  el: "#map",

  initialize: function () {
    _.bindAll(this, "add", "focusMap");
    this.listenTo(this.collection, "reset", this.addAll);
    this.listenTo(this.options.search, "newaddress", this.focusMap);
  },

  render: function () {
    this.$el.height($(window).height() - 275);

    this._map = new google.maps.Map(this.el, {
      center: new google.maps.LatLng(37.7833, -122.4167),
      zoom: 16,
      mapTypeId: google.maps.MapTypeId.ROADMAP
    });

    this._infoWindow = new google.maps.InfoWindow({
      content: "Some content!"
    });

    return this;
  },

  addAll: function (collection) {
    collection.each(this.add);
  },

  add: function (model) {
    var marker = new google.maps.Marker({
      position: new google.maps.LatLng(
        model.get("latitude"),
        model.get("longitude")
      ),
      map: this._map,
      title: model.get("applicant")
    });

    google.maps.event.addListener(marker, "click", function () {
      var content = "<p><strong>" + model.get("applicant") + "</strong></p>" +
        "<p>Address: " + model.get("address") + "</p>" + "<p>Serves: " +
        model.get("fooditems") + "</p>";
      this._infoWindow.setContent(content);
      this._infoWindow.open(this._map, marker);
    }.bind(this));
  },

  focusMap: function (address) {
    var geocoder = new google.maps.Geocoder;

    geocoder.geocode({
      address: address,
      componentRestrictions: {
        locality: "San Francisco"
      }
    }, function (results, status) {
      if (status === google.maps.GeocoderStatus.OK) {
        var latlng = results[0].geometry.location;
        this._map.setCenter(new google.maps.LatLng(
          latlng.ob,
          latlng.pb
        ));
      }
    }.bind(this));
  }
});
