require 'sinatra'
require 'sinatra/reloader'

set :SECRET_NUMBER, rand(100)
@@guesses = 5

get '/' do
  guess = params["guess"]
  cheat = params["cheat"]
  message = cheat == "true" ? "#{secret_number}" : process_guess(guess)
  color = get_color(message)
  erb :index, :locals => {:number => secret_number, :message => message, :color => color}
end

def secret_number
  settings.SECRET_NUMBER
end

def process_guess(guess)
  @@guesses -= 1
  message = compare_guess(guess)
  if message[0..2] == "You"
    reset
    message
  elsif @@guesses == 0
    reset
    "You lost. #{@@guesses} guesses remaining in a new game."
  else
    message
  end
end

def reset
  @@guesses = 5
  settings.SECRET_NUMBER = rand(100)
end

def compare_guess(guess)
  return "Please guess a number." if guess.nil?
  guess = guess.to_i
  if guess > secret_number + 5
    "Way too high!"
  elsif guess < secret_number - 5
    "Way too low!"
  elsif guess > secret_number
    "Too high!"
  elsif guess < secret_number
    "Too low!"
  else
    "You got it right!<br><br>The SECRET NUMBER was #{secret_number}.<br><br>The number has been reset."
  end
end

def get_color(guess_outcome)
  if guess_outcome == "Way too high!" || guess_outcome == "Way too low!"
    "#E8000A"
  elsif guess_outcome == "Too high!" || guess_outcome == "Too low!"
    "#FFA197"
  elsif guess_outcome[0..6] == "You got"
    "#00FF12"
  end
end
