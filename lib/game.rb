# frozen_string_literal: true

require_relative 'player'
require_relative 'board'


class Game
  attr_reader :board, :player1, :player2
  def initialize
    @board = Board.new
    @player1 = Player.new('Player 1', 1)
    @player2 = Player.new('Player 2', 2)
    @current_player = @player1
    puts 'Welcome to Connect Four!'
    game_loop
  end

  def game_loop
    loop do
      @board.display_board
      puts "#{@current_player.name} Enter a column number to place your piece"
      column = get_move
      @board.place_piece(column, @current_player.piece)
      check_game_over
      switch_player
    end
  end

  def get_move
    loop do
      move = gets.chomp.to_i
      return move if @board.valid_move?(move)
      puts 'Invalid move, try again'
    end
  end

  def switch_player
    @current_player = @current_player == @player1 ? @player2 : @player1
  end

  def check_game_over
    if @board.win?
      @board.display_board
      puts "#{@current_player.name} wins!"
      exit
    end
  end

end