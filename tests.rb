require 'minitest/autorun'
require 'minitest/pride'

require './current_weather.rb'
require './weather_forecast'
require './hurricane'
require './astronomy'
require './weather_alert'
require 'httparty'
require 'json'

class CurrentWeather
  def get_json
    JSON.parse(File.open("current_weather.json").read)
  end
end

class WeatherAlert
  def get_json
    JSON.parse(File.open("weather_alert.json").read)
  end
end

class ConsumeApiTest < Minitest::Test

  def test_classes_exists
    assert CurrentWeather
    assert WeatherAlert
    assert WeatherForecast
    assert Hurricane
    assert Astronomy
  end

  # def test_api_is_up
  #   good_response = #<Net::HTTPOK 200 OK readbody=true>
  #   assert_equal good_response, today.summary.header
  # end

  def test_currentweather_accepts_zip
    assert CurrentWeather.new(zip: "47432")
  end

  def test_get_city_state
    test_weather = CurrentWeather.new(zip: "47432")
    assert_equal "French Lick, IN", test_weather.city_state
  end

  def test_get_zip
    test_weather = CurrentWeather.new(zip: "47432")
    assert_equal "47432", test_weather.zip
  end

  def test_weather_for_nil
    todays_weather = CurrentWeather.new(zip: "47432")
    assert_equal "Clear", todays_weather.condition
  end

  def test_temp_f_for_nil
    todays_weather = CurrentWeather.new(zip: "47432")
    assert_equal "75.7 °F", todays_weather.temp_f
  end

  def test_temp_for_nil
    todays_weather = CurrentWeather.new(zip: "47432")
    assert_equal "24.3 °C", todays_weather.temp_c
  end

  def test_wind_for_nil
    todays_weather = CurrentWeather.new(zip: "47432")
    assert_equal "From the WSW at 2.2 MPH Gusting to 6.3 MPH", todays_weather.wind
  end

  def test_number_of_alerts
    todays_alerts = WeatherAlert.new(zip: "47432")
    assert_equal 1, todays_alerts.num_of_alerts
  end

end
