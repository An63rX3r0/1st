require "oga"

class Actor
  attr_accessor :skill, :health, :name

  def initialize (name, skill, health)
    @name = name
    @skill = skill
    @health = health
  end
end

class Player < Actor
  attr_accessor :luck

  def initialize (name)
    super(name, 7 + rand(6), 14 + rand(6) + rand(6))
    @luck = 7 + rand(6)
  end
end

class Monster < Actor; end

p1 = Player.new "Arthur"
puts ("Name: #{p1.name}")
puts ("Skill: #{p1.skill}")
puts ("Health: #{p1.health}")
puts ("Luck: #{p1.luck}")

m1 = Monster.new "Gollum", 7, 10
puts ("Name: #{m1.name}")
puts ("Skill: #{m1.skill}")
puts ("Health: #{m1.health}")
