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

  def get_temp_f
    @summary["current_observation"]["temp_f"]
  end

  def get_temp_c
    @summary["current_observation"]["temp_c"]
  end

  def get_wind
    @summary["current_observation"]["wind_string"]
  end

end
