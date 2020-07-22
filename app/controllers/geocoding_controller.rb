class GeocodingController < ApplicationController

  def street_to_coords
    @street_address = params.fetch("user_street_input")
    
    maps_key = ENV.fetch("GEOCODING_API_KEY")

    url = "https://maps.googleapis.com/maps/api/geocode/json?key=" +  maps_key + "&address=" + @street_address

    api_response = open(url).read

    parsed_data = JSON.parse(api_response)

    first_result = parsed_data.fetch("results").at(0)
    location = first_result.fetch("geometry").fetch("location")

    @latitude = location.fetch("lat")

    @longitude = location.fetch("lng")

    render({ :template => "geocoding_templates/street_to_coords_results.html.erb"})
  end

  def street_to_coords_form
    render({ :template => "geocoding_templates/street_to_coords_form.html.erb"})
  end
end
