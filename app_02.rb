require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'



puts "
------------------------------------------------
|Bienvenue sur 'ILS VEULENT TOUS MA POO' !      |
|Le but du jeu est d'être le dernier survivant !|
------------------------------------------------- 
"

puts "name of the user ? "

name_of_the_user = gets.chomp

user = HumanPlayer.new("name_of_the_user")

return
