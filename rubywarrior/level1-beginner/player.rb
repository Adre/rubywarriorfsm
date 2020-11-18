require_relative 'finite_state_machine'
require 'pry'
require 'forwardable'

class Player
  extend Forwardable
  def_delegators :@warrior, :feel, :health

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
    @health = warrior.health
    finite_state_machine.update
    @previous_health = warrior.health
  end

  def healthy?
    health == 20
  end

  def feel_something?
    !feel.empty?
  end

  def needs_rest?
    health < 10
  end

  def losing_health?
    @health < @previous_health
  end

  private

  attr_reader :finite_state_machine
end
