require 'httparty'

class WeatherAlert

  def initialize(zip:)
    @alerts_response = HTTParty.get("http://api.wunderground.com/api/#{ENV["WUNDERGROUND_KEY"]}/alerts/q/#{zip}.json")
  end

  def number_of_alerts
    @alerts_response["alerts"].length
  end

  def find_alerts
    @alerts_response["alerts"][0]
  end

end
