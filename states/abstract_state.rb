# base class for states showing the general structure we're working with
class AbstractState
  attr_reader :execution_state

  EXECUTION_STATE = {
    none: :none,
    active: :active,
    completed: :completed,
  }

  def initialize(player:, finite_state_machine:)
    @player = player
    @finite_state_machine = finite_state_machine
    execution_state = EXECUTION_STATE[:none]
  end

  # this is executed when we first enter the state 
  def enter_state
    puts "Entering #{self.class}"
    execution_state = EXECUTION_STATE[:active]
  end

  # this is run every tick
  def update_state
    raise "Nothing to do"
  end

  # this is executed when we leave the state
  def exit_state
    puts "Exiting #{self.class}"
    execution_state = EXECUTION_STATE[:completed]
  end

  def key
    self.class.name.downcase.gsub('state', '').to_sym
  end

  private

  attr_reader :finite_state_machine, :player
  attr_accessor :execution_state

  def warrior
    player.warrior
  end
end
