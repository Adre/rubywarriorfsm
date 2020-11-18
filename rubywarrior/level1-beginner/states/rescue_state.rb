require_relative '../../../states/abstract_state'

class RescueState < AbstractState
  def initialize(player:, finite_state_machine:)
    super
  end

  def enter_state
    puts "I sense a friend in need"
    super
  end

  def update_state
    warrior.rescue!
  end

  def exit_state
    super
  end
end
