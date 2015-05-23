require 'httparty'

class Hurricane

  def initialize
    @hurricane_response = get_json
  end

  def number_tracked
    @hurricane_response["currenthurricane"].length
  end

  def number_tracked_string
    if number_tracked == 0
      "Currently no Hurricanes are being tracked."
    elsif number_tracked == 1
      "We are currently tracking #{number_tracked} Hurricane."
    else
      "We are currently tracking #{number_tracked} Hurricanes."
    end
  end

  def get_json
    HTTParty.get("http://api.wunderground.com/api/#{ENV["WUNDERGROUND_KEY"]}/currenthurricane/view.json")
  end

end
