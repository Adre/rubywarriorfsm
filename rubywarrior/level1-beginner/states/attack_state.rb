require_relative '../../../states/abstract_state'

class AttackState < AbstractState
  def initialize(player:, finite_state_machine:)
    super
  end

  def enter_state
    puts "I sense the enemy!"
    super
  end

  def update_state
    warrior.attack!
  end

  def exit_state
    super
  end
end
