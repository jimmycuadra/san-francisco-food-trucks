//= require application

describe("Truck", function () {
  it("is a Backbone model", function () {
    expect(new sfft.Truck).to.be.an.instanceof(Backbone.Model);
  });
});
