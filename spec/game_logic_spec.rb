require './lib/game_logic'

# rubocop: disable Style/MixinUsage

include TicTacToe

# rubocop: enable Style/MixinUsage

describe Board do
  let(:new_board) { described_class.new }

  initial_board = ['+---+---+---+',

                   '| 1 | 2 | 3 |',

                   '+---+---+---+',

                   '| 4 | 5 | 6 |',

                   '+---+---+---+',

                   '| 7 | 8 | 9 |',

                   '+---+---+---+']

  board_update_three = ['+---+---+---+',

                        '| 1 | 2 | O |',

                        '+---+---+---+',

                        '| 4 | 5 | 6 |',

                        '+---+---+---+',

                        '| 7 | 8 | 9 |',

                        '+---+---+---+']

  describe '#initialize' do
    it 'creates an array of numbers from 1 to 9' do
      expect(new_board.board).to eql([1, 2, 3, 4, 5, 6, 7, 8, 9])
    end

    it 'creates a counter with the value of zero' do
      expect(new_board.counter).to eql(0)
    end
  end

  describe '#count' do
    it 'increases counter by one' do
      expect(new_board.count).to eql(1)
    end
  end

  describe '#display_board' do
    it 'returns initial board' do
      expect(new_board.display_board).to eql(initial_board)
    end

    describe '#update_board' do
      it 'takes number of cell as an argument and updates board with O, if counter is even' do
        new_board.update_board(2)

        expect(new_board.board).to eql([1, 'O', 3, 4, 5, 6, 7, 8, 9])
      end

      it 'takes number of cell as an argument and updates board with X, if counter is odd' do
        new_board.count

        new_board.update_board(2)

        expect(new_board.board).to eql([1, 'X', 3, 4, 5, 6, 7, 8, 9])
      end
    end

    it 'returns current status of the board' do
      new_board.update_board(3)

      expect(new_board.display_board).to eq(board_update_three)
    end
  end

  describe '#won?' do
    it 'checks for winning combinations and returns nil if game not won' do
      expect(new_board.won?).not_to be true
    end

    it 'checks for winning combinations of three cells and returns the one that won the game' do
      new_board.count

      new_board.update_board(1)

      new_board.count

      new_board.update_board(2)

      new_board.count

      new_board.update_board(4)

      new_board.count

      new_board.update_board(5)

      new_board.count

      new_board.update_board(7)

      expect(new_board.won?).to be_a(Array)

      expect(new_board.won?).to eql([0, 3, 6])
    end
  end

  describe '#tie?' do
    it 'returns true if all game cells are occupied (game over)' do
      new_board.count

      new_board.update_board(9)

      new_board.count

      new_board.update_board(8)

      new_board.count

      new_board.update_board(7)

      new_board.count

      new_board.update_board(6)

      new_board.count

      new_board.update_board(1)

      new_board.count

      new_board.update_board(4)

      new_board.count

      new_board.update_board(2)

      new_board.count

      new_board.update_board(3)

      new_board.count

      new_board.update_board(5)

      expect(new_board.tie?).to be true
    end
  end
end
