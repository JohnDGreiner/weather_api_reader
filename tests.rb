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

  def test_weather_city_state
    test_weather = CurrentWeather.new(zip: "47432")
    assert_equal "French Lick, IN", test_weather.city_state
  end

  def test_weather_zip
    test_weather = CurrentWeather.new(zip: "47432")
    assert_equal "47432", test_weather.zip
  end

  def test_weather_condition
    test_weather = CurrentWeather.new(zip: "47432")
    assert_equal "Clear", test_weather.condition
  end

  def test_weather_temp_f
    test_weather = CurrentWeather.new(zip: "47432")
    assert_equal "75.7 °F", test_weather.temp_f
  end

  def test_weather_temp_c
    test_weather = CurrentWeather.new(zip: "47432")
    assert_equal "24.3 °C", test_weather.temp_c
  end

  def test_weather_wind
    test_weather = CurrentWeather.new(zip: "47432")
    assert_equal "From the WSW at 2.2 MPH Gusting to 6.3 MPH", test_weather.wind
  end

  def test_number_of_alerts_string
    test_alerts = WeatherAlert.new(zip: "12522")
    assert_equal "There is 1 weather alert.", test_alerts.num_of_alert_string
  end

  def test_alert_num
    test_alerts = WeatherAlert.new(zip: "12522")
    assert_equal 1, test_alerts.num_of_alerts
  end

  def test_alert_descriptions
    test_alerts = WeatherAlert.new(zip: "12522")
    assert "Frost Advisory", test_alerts.alert_descs[0]
  end

  def test_alert_date
    test_alerts = WeatherAlert.new(zip: "12522")
    assert "3:38 am EDT on May 22, 2015", test_alerts.alert_dates[0]
  end

  def test_alert_expires
    test_alerts = WeatherAlert.new(zip: "12522")
    assert "8:00 AM EDT on May 23, 2015", test_alerts.alert_expires[0]
  end



end
