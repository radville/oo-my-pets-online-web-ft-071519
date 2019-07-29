require "pry"

class Owner
  attr_reader :name, :species
  
  @@all = []

  def initialize(name)
    @name = name
    @species = "human"
    @@all << self
  end
  
  def self.all
    @@all
  end
  
  def self.count
    @@all.count
  end
  
  def self.reset_all
    @@all.clear
  end
  
  def say_species
    "I am a #{species}."
  end
  
  def cats
    Cat.all.find_all { |cat| cat.owner == self }
  end
  
  def dogs
    Dog.all.find_all { |dog| dog.owner == self }
  end
  
  def buy_cat(cat)
    Cat.new(cat, self) unless self.cats.include?(cat)
  end

end