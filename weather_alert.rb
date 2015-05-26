require 'httparty'

class WeatherAlert

  def initialize(zip:)
    @zip = zip
    @alerts_response = get_json
  end

  def num_of_alert_string
    if num_of_alerts > 0
      if num_of_alerts > 1
        "There are #{num_of_alerts} weather alerts."
      else
        "There is #{num_of_alerts} weather alert."
      end
    else
      "There are currently no weather alerts for this area."
    end
  end

  def num_of_alerts
    @alerts_response["alerts"].length
  end

  def alert_descs
    @alerts_response["alerts"].map { |d| d["description"]}
  end

  def alert_dates
    @alerts_response["alerts"].map { |d| d["date"]}
  end

  def alert_expires
    @alerts_response["alerts"].map { |e| e["expires"]}
  end

  def get_json
    HTTParty.get("http://api.wunderground.com/api/#{ENV["WUNDERGROUND_KEY"]}/alerts/q/#{zip}.json")
  end

end
