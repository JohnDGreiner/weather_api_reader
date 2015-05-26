require './current_weather.rb'
require './weather_forecast'
require './hurricane'
require './astronomy'
require './weather_alert'
require 'colorize'

def input_validation(user_input)
  if user_input == "exit"
    puts "\nGoodbye\n".light_blue
    exit
  end
  if user_input.to_i.to_s == user_input
    if user_input.length != 5
      puts "Incorrect entry.".red
      puts "\n"
      puts "Please enter a 5 digit Zip code - "
      user_input = gets.chomp
      input_validation(user_input)
    else
      return user_input
    end
  end
end

def current_weather_print(todays_weather)
  puts "\n"
  puts "Today is #{Time.new}".light_blue
  puts "-"*60
  puts "In #{todays_weather.city_state} it is currently #{todays_weather.temp_f} and #{todays_weather.condition} outside."
  puts "  Wind: #{todays_weather.wind}."
end

def alerts_print(todays_alerts)
  puts "\n"
  puts "Weather Alerts".red
  puts "-"*60
  puts todays_alerts.num_of_alert_string
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

def hurricanes_print(todays_hurricanes)
  puts "Hurricane Tracking".red
  puts "-"*60
  puts todays_hurricanes.number_tracked_string
  puts "\n"
  todays_hurricanes.number_tracked.times do |h|
    puts "Name: #{todays_hurricanes.names[h]}"
    puts "Category: #{todays_hurricanes.categories[h]}"
    puts "Windspeed: #{todays_hurricanes.windspeed_mph[h]}MPH"
    puts "Located: #{todays_hurricanes.lats[h]} and #{todays_hurricanes.lons[h]}"
    puts "-"*20
  end
  puts "\n"
end

def run_program(user_input)
  clear_terminal

  todays_weather = CurrentWeather.new(zip: user_input)
  current_weather_print(todays_weather)

  todays_astronomy = Astronomy.new(zip: user_input)
  sun_print(todays_astronomy)

  todays_alerts = WeatherAlert.new(zip: user_input)
  alerts_print(todays_alerts)

  todays_tenday = WeatherForecast.new(zip: user_input)
  tenday_print(todays_tenday)

  todays_hurricanes = Hurricane.new
  hurricanes_print(todays_hurricanes)

  puts "Have a nice day!\n".light_blue
end
