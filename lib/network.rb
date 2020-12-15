class Network
  attr_reader:name,
             :shows
  def initialize(name)
    @name = name
    @shows = []
  end

  def add_show(show)
    @shows << show
  end

  def main_characters
    @shows.map do |show|
      show.characters.find_all do |character|
          character.name == character.name.upcase &&
        character.salary > 500_000
      end
    end.flatten
  end


  def actors_by_show
    @shows.reduce({}) do |collector, show|
      collector[show] = show.actors
      collector
    end
  end

  def character_shows(character_names)
    actor_shows = []
    @shows.each do |show|
      if show.characters.each do |character|
        character_names.include?(character.actor)
        actor_shows << show
        end
      end
    end
    actor_shows.uniq
  end
    ### I THINK I STRAYED A LITTLE BIT ON THESE TWO LOL 
  def shows_by_actor
    character_names = []
    @shows.each do |show|
      show.characters.each do |character|
        character_names << character.actor
        end
      end
      character_names.uniq.reduce({}) do |collector, name|
      collector[name] = character_shows(character_names)
      collector
    end
  end

  def prolific_actors
    actor_names = []
    @shows.each do |show|
      show.characters.each do |character|
        actor_names << character.actor
          end
        end
        actor_names.find_all do |name|
          if (actor_names.count(name) > 1) == true
        return [name]
      end
    end
  end
end
