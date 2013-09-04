# Responsible for fetching data from the San Francisco Data API and creating
# Truck models with their data.
module TruckDataFetcher
  # The URL to get data from.
  API_ENDPOINT = "http://data.sfgov.org/resource/rqzj-sfat.json"

  # Creates Truck records for every record returned by the API. Raises an
  # exception if the API returns an error or if the response cannot be parsed
  # as JSON.
  def self.fetch
    response = Faraday.get(API_ENDPOINT)

    if (200..299) === response.status
      data = MultiJson.load(response.body)
      data.each { |params| Truck.create(params) }
    else
      error_data = MultiJson.load(response.body)
      raise error_data["message"] || "Unknown error"
    end
  rescue MultiJson::LoadError => e
    raise "API response could not be parsed as JSON: #{e}"
  end
end
