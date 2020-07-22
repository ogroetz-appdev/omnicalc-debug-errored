class ForecastController < ApplicationController
  def coords_to_weather
    @lat = params.fetch("user_latitude")
    @lng = params.fetch("user_longitude")

    key = ENV.fetch("DARK_SKY_KEY")

    api_url = "https://api.darksky.net/forecast/"+ key + "/" + @lat + "," +  @lng
    
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

    render({ :template => "forecast_templates/coords_to_weather_results.html.erb"})
  end

  def coords_to_weather_form
    render({ :template => "forecast_templates/coords_to_weather_form.html.erb"})
  end
  
end
