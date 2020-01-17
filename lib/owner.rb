require 'pry'
class Owner
   
  attr_reader :name, :species
  
  @@all = []

  def initialize(name)
    @name = name
    @species = "human"
    @@all << self
  end
  
  def say_species
   "I am a #{@species}."
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
  
  def cats 
    Cat.all.select do |cats|
      cats.owner == self
    end
  end
  
  def dogs 
    Dog.all.select do |dogs|
      dogs.owner == self
    end
  end
  
  def buy_cat(name,owner) 
     Cat.new(name,self)
  end
  
end