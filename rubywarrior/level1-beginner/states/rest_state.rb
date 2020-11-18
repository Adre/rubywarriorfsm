require_relative '../../../states/abstract_state'

class RestState < AbstractState
  def initialize(player:, finite_state_machine:)
    super
  end

  def enter_state
    puts "I must rest"
    super
  end

  def update_state
    player.warrior.rest!
  end

  def exit_state
    super
  end
end
