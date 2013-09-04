require "spec_helper"

describe TrucksController do
  describe "#index" do
    let(:trucks) { 3.times.map { mock_model("Truck") } }

    before { allow(Truck).to receive(:all).and_return(trucks) }

    it "returns an array of all trucks" do
      get :index
      expect(response.status).to eq(200)
      expect(response.body).to eq(trucks.to_json)
    end
  end
end
