require 'sinatra'
require 'sinatra/reloader'

set :SECRET_NUMBER, rand(100)

get '/' do
  guess = params["guess"]
  message = compare_guess(guess)
  color = get_color(message)
  erb :index, :locals => {:number => settings.SECRET_NUMBER, :message => message, :color => color}
end

def compare_guess(guess)
  return "Please guess a number." if guess.nil?
  guess = guess.to_i
  if guess > SECRET_NUMBER + 5
    "Way too high!"
  elsif guess < SECRET_NUMBER - 5
    "Way too low!"
  elsif guess > SECRET_NUMBER
    "Too high!"
  elsif guess < SECRET_NUMBER
    "Too low!"
  else
    "You got it right!<br><br>The SECRET NUMBER is #{SECRET_NUMBER}."
  end
end

def get_color(guess_outcome)
  if guess_outcome == "Way too high!" || guess_outcome == "Way too low!"
    "#E8000A"
  elsif guess_outcome == "Too high!" || guess_outcome == "Too low!"
    "#FFA197"
  elsif guess_outcome[0..2] == "You"
    "#00FF12"
  else
    ""
  end
end
