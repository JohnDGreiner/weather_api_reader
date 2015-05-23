require './current_weather.rb'
require './weather_forecast'
require './hurricane'
require './astronomy'
require './weather_alert'
require 'colorize'

def current_weather_print(todays_weather)
  puts "\n"
  puts "Today is #{Time.new}".light_blue
  puts "-"*60
  puts "In #{todays_weather.city_state} it is currently #{todays_weather.temp_f} and #{todays_weather.condition} outside."
  puts "  Wind: #{todays_weather.wind}."
end

def alerts_print(todays_alerts)
  puts "\n"
  puts todays_alerts.num_of_alert_string.red
  counter = 0
    until todays_alerts.num_of_alerts == 0 || counter == todays_alerts.num_of_alerts
      puts "  #{counter+1}. #{todays_alerts.alert_descs[counter]} until #{todays_alerts.alert_expires[counter]}"
      counter += 1
    end
  puts "\n"
end

def sun_print(todays_astronomy)
  puts "  Sunrise: #{todays_astronomy.sunrise} --> Sunset: #{todays_astronomy.sunset}"
end

def tenday_print(todays_tenday)
  puts "Your 10 Day Forecast".light_blue
  puts "-"*60

  20.times do |f|
    if f != 0 && f % 2 == 0
      puts "-"*20
    end
    puts "#{todays_tenday.day_names[f]}: #{todays_tenday.day_descs[f]}"
  end

  puts "-"*60
  puts "\n"
end

def clear_terminal
  system "clear" or system "cls"
end

clear_terminal
# gets zipcode from user
puts "\n"
puts "Please enter a zipcode for the weather in that area."
zipcode = gets.chomp.to_s
clear_terminal


todays_weather = CurrentWeather.new(zip: zipcode)
current_weather_print(todays_weather)

todays_astronomy = Astronomy.new(zip: zipcode)
sun_print(todays_astronomy)

todays_alerts = WeatherAlert.new(zip: zipcode)
alerts_print(todays_alerts)

todays_tenday = WeatherForecast.new(zip: zipcode)
tenday_print(todays_tenday)
