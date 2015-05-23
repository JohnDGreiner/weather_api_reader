require 'httparty'

class WeatherForecast
  attr_reader :zip

  def initialize(zip:)
    @zip = zip
    @forecast_response = get_json
  end

  def get_json
    HTTParty.get("http://api.wunderground.com/api/#{ENV["WUNDERGROUND_KEY"]}/forecast10day/q/#{zip}.json")
  end

end
