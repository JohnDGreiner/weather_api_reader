require 'httparty'

class WeatherForecast

  def initialize(zip:)
    @zip = zip
    @forecast_response = get_json
  end

  def day_names
    @forecast_response["forecast"]["txt_forecast"]["forecastday"].map { |f| f["title"]}
  end

  def day_descs
    @forecast_response["forecast"]["txt_forecast"]["forecastday"].map { |f| f["fcttext"]}
  end

  def get_json
    HTTParty.get("http://api.wunderground.com/api/#{ENV["WUNDERGROUND_KEY"]}/forecast10day/q/#{zip}.json")
  end

end
