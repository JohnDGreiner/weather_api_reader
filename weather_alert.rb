require 'httparty'

class WeatherAlert
  attr_reader :zip
  def initialize(zip:)
    @zip = zip
    @alerts_response = get_json
  end

  def num_of_alert_string
    number = @alerts_response["alerts"].length
    if number > 0
      if number > 1
        "There are #{number} weather alerts."
      else
        "There is #{number} weather alert."
      end
    else
      "There are currently no weather alerts for this area."
    end
  end

  def num_of_alerts
    @alerts_response["alerts"].length
  end

  def alert_descs
    descs = []
    @alerts_response["alerts"].each { |a|
      descs << a["description"]}
  end

  def alert_dates
    dates = []
    @alerts_response["alerts"].each { |d|
      dates << d["date"]}
  end

  def alert_expires
    expires = []
    @alerts_response["alerts"].each { |e|
      expires << e["expires"]}
  end

  def get_json
    HTTParty.get("http://api.wunderground.com/api/#{ENV["WUNDERGROUND_KEY"]}/alerts/q/#{zip}.json")
  end

end
