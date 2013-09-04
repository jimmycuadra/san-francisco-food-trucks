;(function () {
  var sfft = {
    init: function () {
      console.log("Google Maps is ready.");
    }
  };

  google.maps.event.addDomListener(window, 'load', sfft.init);

  window.sfft = sfft;
})();
