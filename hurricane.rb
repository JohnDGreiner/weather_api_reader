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
    cats = []
    @hurricane_response["currenthurricane"].each { |h|
      cats << h["Current"]["Category"]}
    cats
  end

  def names
    names = []
    @hurricane_response["currenthurricane"].each { |n|
      names << n["stormInfo"]["stormName"]}
    names
  end

  def windspeed_mph
    winds = []
    @hurricane_response["currenthurricane"].each { |w|
      winds << w["Current"]["WindSpeed"]["Mph"]}
    winds
  end

  def lats
    lats = []
    @hurricane_response["currenthurricane"].each { |lat|
      lats << lat["Current"]["lat"]}
    lats
  end

  def lons
    lons = []
    @hurricane_response["currenthurricane"].each { |lon|
      lons << lon["Current"]["lon"]}
    lons
  end

  def get_json
    HTTParty.get("http://api.wunderground.com/api/#{ENV["WUNDERGROUND_KEY"]}/currenthurricane/view.json")
  end

end
