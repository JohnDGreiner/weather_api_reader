require 'httparty'

class WeatherAlert
  attr_reader :zip
  def initialize(zip:)
    @zip = zip
    @alerts_response = get_json
  end

  def number_of_alerts
    @alerts_response["alerts"].length
  end

  def find_alerts
    @alerts_response["alerts"][0]
  end

  def get_json
    HTTParty.get("http://api.wunderground.com/api/#{ENV["WUNDERGROUND_KEY"]}/alerts/q/#{zip}.json")
  end

end
