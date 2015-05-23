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

  def alert_num
    @alerts_response["alerts"].length
  end

  def find_alerts
    @alerts_response["alerts"].each { |a| }

  end

  def get_json
    HTTParty.get("http://api.wunderground.com/api/#{ENV["WUNDERGROUND_KEY"]}/alerts/q/#{zip}.json")
  end

end
