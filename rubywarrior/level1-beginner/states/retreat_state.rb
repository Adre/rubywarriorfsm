require_relative '../../../states/abstract_state'

class RetreatState < AbstractState
  def initialize(player:, finite_state_machine:)
    super
  end

  def enter_state
    puts "I must withdraw"
    super
  end

  def update_state
    player.warrior.walk!(:backward)
  end

  def exit_state
    super
  end
end
