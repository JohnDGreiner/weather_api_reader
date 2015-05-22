require 'minitest/autorun'
require 'minitest/pride'

require './current_weather.rb'
require './forecast'
require './hurricane'
require './astronomy'
require './weather_alert'
require 'httparty'

class ConsumeApiTest < Minitest::Test

  def test_classes_exists
    assert CurrentWeather
    assert WeatherAlert
    assert Forecast
    assert Hurricane
    assert Astronomy
  end

  def test_currentweather_accepts_zip
    assert CurrentWeather.new(zip: "47432")
  end

  def test_response_for_current_weather
    todays_weather = CurrentWeather.new(zip: "47432")
    assert_equal "47432", todays_weather.get_zip
  end

  def test_response_for_alerts
    todays_alerts = WeatherAlert.new(zip: "47432")
    refute_equal nil, todays_alerts.number_of_alerts
    # good_response = #<Net::HTTPOK 200 OK readbody=true>
    # assert_equal good_response, today.summary.header
  end


  def test_weather_for_nil
    todays_weather = CurrentWeather.new(zip: "47432")
    refute_equal nil, todays_weather.weather_condition
  end

  def test_temp_f_for_nil
    todays_weather = CurrentWeather.new(zip: "47432")
    refute_equal nil, todays_weather.get_temp_f
  end

  def test_temp_for_nil
    todays_weather = CurrentWeather.new(zip: "47432")
    refute_equal nil, todays_weather.get_temp_c
  end

  def test_wind_for_nil
    todays_weather = CurrentWeather.new(zip: "47432")
    refute_equal nil, todays_weather.get_wind
  end

end
