require_relative 'abstract_state'

class ExampleState < AbstractState
  def initialize(player:, finite_state_machine:)
    super
    # set up any config
  end

  def enter_state
    super
    # set up initial state
  end

  def update_state
    # Do something
    puts "Doing the thing..."
    warrior.do_a_thing!
  end

  def exit_state
    super
  end

  def key
    :example
  end
end
