require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'



#test des méthodes de la classe player avec players 1 et 2 / test des méthodes de la classe HumanPlayer avec player 3 

player1 = Player.new("Josiane")
player2 = Player.new("José")
player3 = HumanPlayer.new("Jacques") 


# test du jeu 1.0
while player1.life_points > 0 && player2.life_points > 0 do  
	puts " "
	puts "Voici l'état de chaque joueur :"
	player1.show_state
	player2.show_state
	puts " "
	puts "Passons à la phase d'attaque :"
	player1.attacks(player2)
		if player2.life_points <= 0
			player2.show_state
		end 
	break if player2.life_points <= 0
	player2.attacks(player1)
		if player1.life_points <= 0
			player1.show_state
		end
end  


binding.pry #pour tester les méthodes de la classe Human Player avec player3