require_relative 'finite_state_machine'
require 'pry'

class Player
  attr_reader :warrior
  attr_accessor :idled_for, :patrolled_for

  def initialize
    @idled_for = 0
    @patrolled_for = 0

    @finite_state_machine = FiniteStateMachine.new(player: self)
    finite_state_machine.start
  end

  def play_turn(warrior)
    @warrior = warrior
    finite_state_machine.update
  end

  private

  attr_reader :finite_state_machine
end
