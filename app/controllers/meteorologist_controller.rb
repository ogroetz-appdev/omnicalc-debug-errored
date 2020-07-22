class MeteorologistController < ApplicationController
  def street_to_weather
    @street_address = params.fetch("address")
    
    maps_key = ENV.fetch("GEOCODING_API_KEY")

    url = "https://maps.googleapis.com/maps/api/geocode/json?key=" +  maps_key + "&address=" + @street_address

    api_response = open(url).read

    parsed_data = JSON.parse(api_response)

    first_result = parsed_data.fetch("results").at(0)
    location = first_result.fetch("geometry").fetch("location")

    @lat = location.fetch("lat").to_s

    @lng = location.fetch("lng").to_s

    dark_sky_key = ENV.fetch("DARK_SKY_KEY")

    api_url = "https://api.darksky.net/forecast/"+ dark_sky_key + "/" + @lat + "," +  @lng
    
    api_response = open(api_url).read
    results = JSON.parse(api_response)

    currently_data = results.fetch("currently")
    @current_temperature = currently_data.fetch("temperature")

    @current_summary = currently_data.fetch("summary")
    
    if results.has_key?("minutely")
      @summary_of_next_sixty_minutes = results.fetch("minutely").fetch("summary")
    else
      @summary_of_next_sixty_minutes = "Not available"
    end

    @summary_of_next_several_hours = results.fetch("hourly").fetch("summary")

    @summary_of_next_several_days = results.fetch("daily").fetch("summary")

    render({ :template => "meteorologist_templates/street_to_weather_results.html.erb"})
  end

  def street_to_weather_form
    render({ :template => "meteorologist_templates/street_to_weather_form.html.erb"})
  end
end
