## Web Guesser
A simple guessing game using Ruby, Sinatra, and ERB made for the web. This version changes background colors based on the proximity of the user's guess to the randomly generated number (0 to 100), and limits the number of guesses per game to 5.

### Usage
Launch the application in your terminal with `ruby web_guesser.rb`. Then, in your web browser, navigate to `http://localhost:4567/`.

Should a user wish to cheat, they can do so by appending `&cheat=true` after the guess, e.g., `http://localhost:4567/?guess=34&cheat=true`.
