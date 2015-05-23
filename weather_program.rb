require './current_weather.rb'
require './weather_forecast'
require './hurricane'
require './astronomy'
require './weather_alert'

def current_weather_print(todays_weather)
  puts "\n"
  puts "#{Time.new}"
  puts "-"*60
  puts "In #{todays_weather.city_state} it is currently #{todays_weather.temp_f} and #{todays_weather.condition} outside."
  puts "Wind: #{todays_weather.wind}."
end

def alerts_print(todays_alerts)
  puts "\n"
  puts todays_alerts.num_of_alert_string
  counter = 0
    until todays_alerts.num_of_alerts == 0 || counter > todays_alerts.num_of_alerts
      puts todays_alerts.alert_descs[counter] + " until " + todays_alerts.alert_expires[counter]
      counter += 1
    end
  puts "\n"
end



# clear terminal
system "clear" or system "cls"

# gets zipcode from user
puts "\n"
puts "Please enter a zipcode for the weather in that area."
zipcode = gets.chomp.to_s

todays_weather = CurrentWeather.new(zip: zipcode)
current_weather_print(todays_weather)

todays_alerts = WeatherAlert.new(zip: zipcode)
alerts_print(todays_alerts)
