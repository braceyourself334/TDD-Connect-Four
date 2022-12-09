require_relative '../lib/game'

describe Game do
  context 'when creating a new game' do
    describe 'initialize' do
      it 'creates a new board' do
        game = Game.new
        expect(game.board).to be_a(Board)
      end

      it 'creates two players' do
        game = Game.new
        expect(game.player1).to be_a(Player)
        expect(game.player2).to be_a(Player)
      end

      it 'sets the first player to player 1' do
        game = Game.new
        expect(game.player1.name).to eq('Player 1')
      end

    end
  end

  context ' when getting a move' do
    describe 'get_move' do
      it 'returns a number between 0 and 6' do
        game = Game.new
        allow(game).to receive(:gets).and_return('1')
        expect(game.get_move).to be_between(0, 6)
      end
    end
  end

  context 'when switching players' do
    describe 'switch_player' do
      it 'changes the current player' do
        game = Game.new
        game.switch_player
        expect(game.current_player).to eq(game.player2)
      end
    end
  end

  context 'when checking for a win' do
    describe 'check_game_over' do
      it 'returns true if there is a win' do
        game = Game.new
        allow(game).to receive(:gets).and_return('1')
        4.times { game.game_loop }
        expect(game.check_game_over).to be true
      end
    end
  end

end