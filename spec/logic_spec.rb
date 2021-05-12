require_relative '../lib/logic.rb'
include TicTacToe

describe Board do
  let (:new_board) {described_class.new}

  describe '#initialize' do
    it 'creates an array of numbers from 1 to 9' do
      expect(subject.board).to eql([1, 2, 3, 4, 5, 6, 7, 8, 9])
    end

    it 'creates a counter with the value of zero'
     expect(subject.counter).to eql(0)
  end

  describe '#display_board' do
    it 'returns current status of the board' do
      expect(subject.display_board).to eq (['+---+---+---+',
       "| 1 | 2 | 3 |",
       '+---+---+---+',
       "| 4 | 5 | 6 |",
       '+---+---+---+',
       "| 7 | 8 | 9 |",
       '+---+---+---+'])
    end
    it 'returns current status of the board' do
      @board = [1, "X" , 3, 4, 5, 6, 7, 8, 9]
        expect(board.display_board).to eq (['+---+---+---+',
        "| 1 | X | 3 |",
        '+---+---+---+',
        "| 4 | 5 | 6 |",
        '+---+---+---+',
        "| 7 | 6 | 9 |",
        '+---+---+---+'])
    end
  end
end

