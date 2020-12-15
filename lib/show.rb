class Show
  attr_reader:name,
             :creator,
             :characters
  def initialize(name, creator, characters)
    @name = name
    @creator = creator
    @characters = characters
  end

  def total_salary
    characters.sum do |character|
      character.salary
    end
  end

  def highest_paid_actor
    characters.max_by do |character|
      character.salary
    end.actor
  end

  def actors
    actor_names = []
    characters.each do |character|
      actor_names << character.actor
    end
    actor_names 
  end
end
