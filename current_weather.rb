require 'httparty'

class CurrentWeather
attr_reader :conditions_response, :zip

  def initialize(zip:)
    @zip = zip
    @conditions_response = get_json
  end

  def zip
    @conditions_response["current_observation"]["display_location"]["zip"]
  end

  def city_state
    @conditions_response["current_observation"]["display_location"]["full"]
  end

  def condition
    @conditions_response["current_observation"]["weather"]
  end

  def temp_f
    @conditions_response["current_observation"]["temp_f"].to_s + " °F"
  end

  def temp_c
    @conditions_response["current_observation"]["temp_c"].to_s + " °C"
  end

  def wind
    @conditions_response["current_observation"]["wind_string"]
  end

  def get_json
    HTTParty.get("http://api.wunderground.com/api/#{ENV["WUNDERGROUND_KEY"]}/conditions/q/#{zip}.json")
  end

end
