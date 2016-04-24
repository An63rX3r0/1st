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

class Item; end

class Step
  attr_accessor :text, :id, :choices, :fighters

  @@story = {}

  def initialize(step_xml)
    @text = step_xml.xpath("text").text
    @id = step_xml.get("id")
    @choices = step_xml.xpath('choices/choice').map do |choice|
      choice.text.to_i
    end
    @fighters = step_xml.xpath('fight/fighter').map do |fighter|
      Monster.new(fighter.get('name'), fighter.get('skill'), fighter.get('health'))
    end
    @@story[@id] = self
  end

  def self.story
    @@story
  end

  def to_s
    "#{@id}: #{@text}"
  end
end

p1 = Player.new "Arthur"
puts ("Name: #{p1.name}")
puts ("Skill: #{p1.skill}")
puts ("Health: #{p1.health}")
puts ("Luck: #{p1.luck}")

m1 = Monster.new "Gollum", 7, 10
puts ("Name: #{m1.name}")
puts ("Skill: #{m1.skill}")
puts ("Health: #{m1.health}")

handle = File.open('C:\Users\Paulo Miranda\Projectos\1st\Template data.xml')
document = Oga.parse_xml(handle)

document.xpath('story/step').each do |step|
  Step.new(step)
end

# puts Step.story

Step.story.each_value do |value|
  puts value
end
