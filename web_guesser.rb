require 'sinatra'
require 'sinatra/reloader'

set :SECRET_NUMBER, rand(100)

get '/' do
  guess = params["guess"]
  message = compare_guess(guess)
  erb :index, :locals => {:number => settings.SECRET_NUMBER, :message => message}
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
