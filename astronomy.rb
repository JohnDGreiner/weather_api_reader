require 'httparty'

class Astronomy

  def initialize(zip:)
    @zip = zip
    @astronomy_response = get_json
  end

  def sunrise
    "#{@astronomy_response["moon_phase"]["sunrise"]["hour"]}:#{@astronomy_response["moon_phase"]["sunrise"]["minute"]}"
  end

  def sunset
    "#{@astronomy_response["moon_phase"]["sunset"]["hour"]}:#{@astronomy_response["moon_phase"]["sunset"]["minute"]}"
  end

  def get_json
    HTTParty.get("http://api.wunderground.com/api/#{ENV["WUNDERGROUND_KEY"]}/astronomy/q/#{zip}.json")
  end

end
