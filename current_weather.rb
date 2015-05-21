require 'httparty'

class CurrentWeather
attr_reader :summary

  def initialize(zip:)
    @summary = HTTParty.get("http://api.wunderground.com/api/#{ENV["WUNDERGROUND_KEY"]}/conditions/q/#{zip}.json")
  end

  def get_zip
    @summary["current_observation"]["display_location"]["zip"]
  end

  def weather_condition
    @summary["current_observation"]["weather"]
  end

end
