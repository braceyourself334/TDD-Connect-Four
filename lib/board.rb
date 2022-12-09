# frozen_string_literal: true

class Board
  attr_reader :board
  def initialize
    # board[column][row]
    @board = Array.new(7) { Array.new(6, 0) }
  end

  def valid_move?(column)
    @board[column].any?(0)
  end

  def place_piece(column, player)
    @board[column][@board[column].index(0)] = player
  end

  def win?
    horizontal_win? || vertical_win? || diagonal_win?
  end

  def horizontal_win?
    @board.any? do |column|
      column.each_cons(4).any? { |row| row.all?(row[0]) && row[0] != 0 }
    end
  end

  def vertical_win?
    @board.transpose.any? do |row|
      row.each_cons(4).any? { |column| column.all?(column[0]) && column[0] != 0 }
    end
  end

  def diagonal_win?
    diagonal_win_helper?(@board) || diagonal_win_helper?(@board.reverse)
  end

  def diagonal_win_helper?(board)
    board.each_with_index do |column, column_index|
      column.each_with_index do |row, row_index|
        next if row.zero?

        return true if diagonal_win_check?(board, column_index, row_index)
      end
    end
    false
  end

  def diagonal_win_check?(board, column_index, row_index)
    return false if column_index > 3 || row_index > 2

    4.times do |i|
      return false if board[column_index + i][row_index + i] != board[column_index][row_index]
    end
    true
  end

  
  
end

test = Board.new
puts test.inspect