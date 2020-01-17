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
  
  def buy_cat(name) 
     Cat.new(name,self)
  end
  
  def buy_dog(name)
    Dog.new(name, self)
  end
  
  def walk_dogs
    Dog.all.select do |dog|
      if dog.mood == "nervous" 
        dog.mood = "happy"
      end
    end
  end

  def feed_cats
    Cat.all.select do |cat|
      if cat.mood == "nervous"
        cat.mood = "happy"
      end
    end
  end

  def sell_pets
    Cat.all.select {|cat| cat.mood = "nervous"}
    Cat.all.each {|cat| cat.owner = nil}
    Dog.all.select {|dog| dog.mood = "nervous"}
    Dog.all.each {|dog| dog.owner = nil}
  end
  
  def list_pets
    # Cat.all.each {|cat| cat}
    # Dog.all.each {|dog| dog}
      puts "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)"
  end
   
  

end