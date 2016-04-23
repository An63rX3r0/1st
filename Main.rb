require "oga"

class Actor
  attr_accessor :agility, :strenght, :name

  def initialize (name, agility, strength)
    @name = name
    @agility = agility
    @strength = strength
  end
end

class Player < Actor
  attr_accessor :luck

  def initialize (name)
    super(name, 7 + rand(6), 13 + rand(6))
    @luck = 7 + rand(6)
  end
end

class Monster < Actor; end

p1 = Player.new "Arthur"
puts ("Name: #{p1.name}")
puts ("Skill: #{p1.agility}")
puts ("Life: #{p1.strength}")
puts ("Luck: #{p1.luck}")

m1 = Monster.new "Gollum", 7, 10
puts ("Name: #{m1.name}")
puts ("Skill: #{m1.agility}")
puts ("Life: #{m1.strength}")
