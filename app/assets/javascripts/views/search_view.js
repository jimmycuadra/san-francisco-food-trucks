sfft.SearchView = Backbone.View.extend({
  el: "#search",

  events: {
    "submit": "sendAddress"
  },

  sendAddress: function (event) {
    event.preventDefault();

    this.trigger("newaddress", $("#search-address").val());
  }
});
