require './weather_program_methods.rb'

clear_terminal

# gets zipcode or city, state from user
puts "\n"
puts "Please enter a Zipcode or City, State for the weather in that area."
user_input = gets.chomp
input_validation(user_input)

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

puts "Have a nice day!".light_blue
puts "\n"
