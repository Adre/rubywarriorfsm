Dir['states/*.rb'].each { |file| require file }

class FiniteStateMachine
  VALID_STATES = {
    idle: IdleState,
    patrol: PatrolState,
    attack: AttackState,
    rest: RestState,
    retreat: RetreatState,
    rescue: RescueState,
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
    @starting_state = states[:patrol]

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
    when :patrol
      enter_state states[:attack] if player.warrior.feel.enemy?
      enter_state states[:rescue] if player.warrior.feel.captive?
    when :attack
      return if player.feel_something?

      if player.needs_rest?
        enter_state states[:rest]
      else
        enter_state states[:patrol]
      end
    when :rest
      enter_state states[:retreat] if player.losing_health?
      enter_state states[:patrol] if player.healthy?
    when :retreat_state
      enter_state states[:rest] unless player.losing_health?
    when :rescue
      enter_state states[:patrol] unless player.feel_something?
    end
  end

  private

  attr_reader :player, :states, :starting_state, :idle_for, :patrol_for
  attr_accessor :current_state
end
