//= require application

describe("TruckSet", function () {
  it("is a collection of Truck models", function () {
    expect((new sfft.TruckSet).model).to.eq(sfft.Truck);
  });
});
