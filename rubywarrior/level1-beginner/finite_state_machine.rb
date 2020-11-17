require 'states/idle_state'
require 'states/patrol_state'

class FiniteStateMachine
  VALID_STATES = {
    idle: IdleState,
    patrol: PatrolState
  }

  def initialize(player:)
    @player = player
    @states = {}
    VALID_STATES.each do |key, value|
      @states[key] = value.new(
        player: player,
        finite_state_machine: self
      )
    end
    @current_state = nil
    @starting_state = states[:idle]

    @idle_for = 1
    @patrol_for = 2
  end

  def start
    enter_state starting_state
  end

  def enter_state(next_state)
    exit_state current_state if current_state

    self.current_state = next_state
    current_state.enter_state
  end

  def exit_state(current_state)
    current_state.exit_state
  end

  def update
    transition_state
    current_state.update_state
  end

  def transition_state
    case current_state.key
    when :idle
      enter_state states[:patrol] if player.idled_for >= idle_for
    when :patrol
      enter_state states[:idle] if player.patrolled_for >= patrol_for
    end
  end

  private

  attr_reader :player, :states, :starting_state, :idle_for, :patrol_for
  attr_accessor :current_state
end
