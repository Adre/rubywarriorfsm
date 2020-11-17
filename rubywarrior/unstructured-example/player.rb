class Player
  attr_accessor :health, :warrior

  def play_turn(warrior)
    @warrior = warrior
    @health ||= warrior.health

    if in_danger?
      be_offensive
    elsif not_feeling_great?
      rest!
    else
      be_a_hero
    end

    @health = warrior.health
  end

  def in_danger?
    taking_damage? || enemy_present?
  end

  def taking_damage?
    warrior.health < health
  end

  def enemy_present?
    !warrior.feel.empty? &&
      !captive_present?
  end

  def captive_present?
    warrior.feel.captive?
  end

  def not_feeling_great?
    warrior.health <= 12
  end

  def be_offensive
    if enemy_present?
      attack!
    else
      advance!
    end
  end

  def be_a_hero
    if captive_present?
      warrior.rescue!
    else
      advance!
    end
  end

  def advance!
    warrior.walk!
  end

  def attack!
    warrior.attack!
  end

  def rest!
    warrior.rest!
  end



end
