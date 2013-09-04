require "spec_helper"

describe TruckDataFetcher do
  describe ".fetch" do
    let(:response) { double("Faraday::Response", status: 200, body: "[]") }

    before do
      allow(Faraday).to receive(:get).and_return(response)
    end

    it "fetches food truck data from the San Francisco Data API" do
      expect(Faraday).to receive(:get).with(described_class::API_ENDPOINT)
      described_class.fetch
    end

    context "when the API returns an error" do
      let(:response) do
        double(
          "Faraday::Response",
          status: 500,
          body: <<-JSON.chomp
{
  "message": "Only simple comparison filters are allowed"
}
          JSON
        )
      end

      it "raises an exception with the error message" do
        expect do
          described_class.fetch
        end.to raise_error("Only simple comparison filters are allowed")
      end
    end

    context "when the response is not parseable as JSON" do
      let(:response) { double("Faraday::Response", status: 500, body: "asdf") }

      it "raises an exception letting the developer know" do
        expect do
          described_class.fetch
        end.to raise_error(/API response could not be parsed as JSON:/)
      end
    end

    it "creates Truck records for each truck returned by the API" do
      allow(response).to receive(:body).and_return <<-JSON.chomp
[
    {
        "longitude": "-122.398658184604",
        "latitude": "37.7901490737255",
        "objectid": "427856"
    },
    {
        "longitude": "-122.395881037818",
        "latitude": "37.7891192079118",
        "objectid": "427795"
    }
]
JSON
      expect(Truck).to receive(:create) do |params|
        expect(params["longitude"]).to eq("-122.398658184604")
        expect(params["latitude"]).to eq("37.7901490737255")
        expect(params["objectid"]).to eq("427856")
      end
      expect(Truck).to receive(:create) do |params|
        expect(params["longitude"]).to eq("-122.395881037818")
        expect(params["latitude"]).to eq("37.7891192079118")
        expect(params["objectid"]).to eq("427795")
      end
      described_class.fetch
    end
  end
end
