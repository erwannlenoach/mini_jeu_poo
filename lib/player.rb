require "pry"

class Player
	attr_accessor :name, :life_points 
	@@all_players = Array.new

	def initialize(name)
		@name = name
		@life_points = 10
		@@all_players << self
	end 

	def show_state
		if @life_points  <= 0 #message de mort si les points de vie tombent en dessous de 0 / sinon affichage des points de vie 
			puts "le joueur #{@name} a été tué"
		else puts "#{@name} a #{@life_points} points de vie"
			end 
	end  

	def gets_damage(damage) #prise en compte des dommages subis via la fonction attacks
		@life_points = @life_points - damage
	end 

	def attacks(target)  #attaque en fonction du résultat du lancé de dès - call de la fonction compute_damage
		damage = compute_damage
		target.gets_damage(damage)
      	puts " #{@name} attaque #{target.name}"
       	puts "il lui inflige #{damage} points de dommages"		
	end

 	def compute_damage
    	return rand(1..6)
  	end

end 

class HumanPlayer < Player #le jeu 2.0 n'est pas fini mais les méthodes de HumanPlayer sont fonctionnelles

  	attr_accessor :weapon_level

	def initialize(name)
 		super(name) 
   		@life_points = 100
   		@weapon_level = 1
  	end

  	def show_state
	
		if @life_points  <= 0 #message de mort si les points de vie tombent en dessous de 0
			puts "le joueur #{@name} a été tué"
		else puts "#{@name} a #{@life_points} points de vie et a une arme de niveau #{@weapon_level}"
		end 
	end

	def compute_damage
    	return rand(1..6) * @weapon_level
  	end


  	def search_weapon
		new_weapon = rand(1..6) 
		puts "tu a trouvé une arme de niveau #{new_weapon}"
		if new_weapon > @weapon_level
			@weapon_level = new_weapon
		else puts "c'est de la merde, garde ton arme actuelle"
		end 
	end 

	def search_health_pack

		health_pack= rand(1..6) 

		if health_pack == 1
			puts "tu n'as rien trouvé looser"
		elsif health_pack >= 2 && health_pack <= 5 
			puts "Bravo, tu as trouvé un pack de +50 points de vie !"
			@life_points + 50
		elsif health_pack == 6
			puts "Bravo, tu as trouvé un pack de +80 points de vie !"
			@life_points + 80
		end 

	if @life_points > 100
	@life_points = 100
	end 

	return @life_points
	end 


end 
	