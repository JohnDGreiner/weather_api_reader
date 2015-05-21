require 'minitest/autorun'
require 'minitest/pride'

require './current_weather.rb'
require 'httparty'

class ConsumeApiTest < Minitest::Test

  def test_currentweather_exists
    assert CurrentWeather
  end

  def test_currentweather_accepts_zip
    assert CurrentWeather.new(zip: "47432")
  end

  def test_response_from_wunderground
    assert todays_weather = CurrentWeather.new(zip: "47432")
    assert_equal "47432", todays_weather.get_zip

    # good_response = #<Net::HTTPOK 200 OK readbody=true>
    # assert_equal good_response, today.summary.header
  end



end
