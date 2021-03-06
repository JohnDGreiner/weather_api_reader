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

class Astronomy
  def get_json
    JSON.parse(File.open("astronomy.json").read)
  end
end

class WeatherForecast
  def get_json
    JSON.parse(File.open("weather_forecast.json").read)
  end
end

class Hurricane
  def get_json
    JSON.parse(File.open("hurricane.json").read)
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
    test_alerts = WeatherAlert.new(zip: "76366")
    assert_equal "There are 2 weather alerts.", test_alerts.num_of_alert_string
  end

  def test_alert_num
    test_alerts = WeatherAlert.new(zip: "76366")
    assert_equal 2, test_alerts.num_of_alerts
  end

  def test_alert_descriptions
    test_alerts = WeatherAlert.new(zip: "76366")
    assert_equal "Tornado Watch", test_alerts.alert_descs[0]
  end

  def test_alert_date
    test_alerts = WeatherAlert.new(zip: "76366")
    assert_equal "1:43 PM CDT on May 23, 2015", test_alerts.alert_dates[0]
  end

  def test_alert_expires
    test_alerts = WeatherAlert.new(zip: "76366")
    assert_equal "7:00 PM CDT on May 23, 2015", test_alerts.alert_expires[0]
  end

  def test_sunrise_time
    test_astronomy = Astronomy.new(zip: "47432")
    assert_equal "6:29", test_astronomy.sunrise
  end

  def test_sunset_time
    test_astronomy = Astronomy.new(zip: "47432")
    assert_equal "20:57", test_astronomy.sunset
  end

  def test_day_names_array
    test_tenday = WeatherForecast.new(zip: "47432")
    assert_equal 20, test_tenday.day_names.length
    assert_equal "Friday", test_tenday.day_names[0]
  end

  def test_day_descs_array
    test_tenday = WeatherForecast.new(zip: "47432")
    assert_equal 20, test_tenday.day_descs.length
    assert_equal "Lots of sunshine. High around 75F. Winds W at 10 to 15 mph.",
      test_tenday.day_descs[0]
  end

  def test_number_of_hurricanes_tracked
    test_hurricanes = Hurricane.new
    assert_equal 1, test_hurricanes.number_tracked
  end

  def test_number_tracked_string
    test_hurricanes = Hurricane.new
    assert_equal "We are currently tracking 1 Hurricane.", test_hurricanes.number_tracked_string
  end

  def test_category_of_hurricane
    test_hurricanes = Hurricane.new
    assert_equal "Invest", test_hurricanes.categories[0]
  end

  def test_name_of_hurricane
    test_hurricanes = Hurricane.new
    assert_equal "90E", test_hurricanes.names[0]
  end

  def test_wind_speed
    test_hurricanes = Hurricane.new
    assert_equal 30, test_hurricanes.windspeed_mph[0]
  end

  def test_lats
    test_hurricanes = Hurricane.new
    assert_equal 5.8, test_hurricanes.lats[0]
  end

  def test_lons
    test_hurricanes = Hurricane.new
    assert_equal -135.6, test_hurricanes.lons[0]
  end

end
