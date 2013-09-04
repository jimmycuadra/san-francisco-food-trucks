sfft.MapView = Backbone.View.extend({
  el: "#map",

  initialize: function () {
    _.bindAll(this, "add");
    this.listenTo(this.collection, "reset", this.addAll)
  },

  render: function () {
    this.$el.height($(window).height() - 200);

    this._map = new google.maps.Map(this.el, {
      center: new google.maps.LatLng(37.7833, -122.4167),
      zoom: 15,
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
  }
});
