require 'httparty'

class Astronomy
  attr_reader :zip

  def initialize(zip:)
    @zip = zip
    @alerts_response = get_json
  end

  def get_json
    HTTParty.get("http://api.wunderground.com/api/#{ENV["WUNDERGROUND_KEY"]}/astronomy/q/#{zip}.json")
  end

end
