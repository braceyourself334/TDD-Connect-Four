#frozen_string_literal: true

class player
  attr_reader :name, :piece
  def initialize(name, number)
    @name = name
    @piece = number
  end
end