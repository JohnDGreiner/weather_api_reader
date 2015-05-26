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

  def categories
    @hurricane_response["currenthurricane"].map { |h| h["Current"]["Category"]}
  end

  def names
    @hurricane_response["currenthurricane"].map { |n| n["stormInfo"]["stormName"]}
  end

  def windspeed_mph
    @hurricane_response["currenthurricane"].map { |w| w["Current"]["WindSpeed"]["Mph"]}
  end

  def lats
    @hurricane_response["currenthurricane"].map { |lat| lat["Current"]["lat"]}
  end

  def lons
    @hurricane_response["currenthurricane"].map { |lon| lon["Current"]["lon"]}
  end

  def get_json
    HTTParty.get("http://api.wunderground.com/api/#{ENV["WUNDERGROUND_KEY"]}/currenthurricane/view.json")
  end

end
