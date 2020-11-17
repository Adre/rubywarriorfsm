require_relative '../../../states/abstract_state'

class PatrolState < AbstractState
  def initialize(player:, finite_state_machine:)
    super
  end

  def enter_state
    puts "I must proceed"
    super
  end

  def update_state
    player.warrior.walk!
    player.patrolled_for += 1
  end

  def exit_state
    player.patrolled_for = 0
    super
  end

  def key
    :patrol
  end
end
