require_relative '../lib/board'

describe Board do
  context 'when creating a new board' do
    describe 'initialize' do

      it 'creates a board 7 columns wide' do
        board = Board.new
        expect(board.board.size).to eq(7)
      end

      it 'create a board 6 rows high' do
        board = Board.new
        expect(board.board[0].length).to eq(6)
      end

    end
  end

  context 'when checking for a valid move' do
    describe 'valid_move?' do
      it 'returns true if the column is not full' do
        board = Board.new
        expect(board.valid_move?(0)).to be true
      end

      it 'returns false if the column is full' do
        board = Board.new
        # This doesn't test for a full column, just for a column with no 0's
        6.times { board.board[0].pop }
        expect(board.valid_move?(0)).to be false
      end
    end
  end

  context 'when placing a piece' do
    describe 'place_piece' do
      it 'places a piece in the lowest available spot' do
        board = Board.new
        board.place_piece(0, 1)
        board.place_piece(0, 1)
        expect(board.board[0][5]).to eq(1)
      end
    end
  end

  context 'checking for a win' do
    describe 'win?' do
      it 'returns true if there is a horizontal win' do
        board = Board.new
        4.times { |i| board.board[i][0] = 1 }
        expect(board.win?).to be true
      end

      it 'returns true if there is a vertical win' do
        board = Board.new
        4.times { |i| board.board[0][i] = 1 }
        expect(board.win?).to be true
      end

      it 'returns true if there is a diagonal win' do
        board = Board.new
        4.times { |i| board.board[i][i] = 1 }
        expect(board.win?).to be true
      end
    end
  end
end