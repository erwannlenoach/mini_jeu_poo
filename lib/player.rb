require "pry"

class Player
	attr_accessor :name, :life_points, :target, :damage
	@@all_players = Array.new

	def initialize(name)
		@name = name
		@life_points = 10
		@@all_players << self
	end 

	def show_state
		
		if @life_points  <= 0 #message de mort si les points de vie tombent en dessous de 0
			puts "le joueur #{@name} a été tué"
		else puts "#{@name} a #{@life_points} points de vie"
			end 
	end  

	def gets_damage(damage)
		@life_points = @life_points - damage
	end 

	def attacks(target) 
		damage = compute_damage
		target.gets_damage(damage)
      	puts " #{@name} attaque #{target.name}"
       	puts "il lui inflige #{damage} points de dommages"		
	end

 	def compute_damage
    	return rand(1..6)
  	end

end 