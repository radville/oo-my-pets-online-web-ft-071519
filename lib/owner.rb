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
  
  def buy_dog(dog)
    Dog.new(dog, self) unless self.dogs.include?(dog)
  end
  
  def walk_dogs
    self.dogs.map! { |dog| dog.mood = "happy" }
  end
  
  def feed_cats
    self.cats.map! { |cat| cat.mood = "happy" }
  end
  
  def sell_pets
    self.cats.map! do |cat| 
      cat.mood = "nervous" 
      cat.owner = nil
    end
    self.dogs.map! do |dog| 
      dog.mood = "nervous"
      dog.owner = nil
    end
  end
  
  def list_pets
    ""
  end

end