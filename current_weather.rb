require 'httparty'

class CurrentWeather
attr_reader :conditions_response

  def initialize(zip:)
    @conditions_response = HTTParty.get("http://api.wunderground.com/api/#{ENV["WUNDERGROUND_KEY"]}/conditions/q/#{zip}.json")
  end

  def get_zip
    @conditions_response["current_observation"]["display_location"]["zip"]
  end

  def weather_condition
    @conditions_response["current_observation"]["weather"]
  end

  def get_temp_f
    @conditions_response["current_observation"]["temp_f"]
  end

  def get_temp_c
    @conditions_response["current_observation"]["temp_c"]
  end

  def get_wind
    @conditions_response["current_observation"]["wind_string"]
  end

end
