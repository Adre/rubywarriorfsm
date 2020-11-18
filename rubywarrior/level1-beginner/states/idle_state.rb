require_relative '../../../states/abstract_state'

class IdleState < AbstractState
  def initialize(player:, finite_state_machine:)
    super
  end

  def enter_state
    puts "I should stop a moment"
    super
  end

  def update_state
    player.idled_for += 1
  end

  def exit_state
    player.idled_for = 0
    super
  end
end
