require_relative '../lib/logic.rb'
include TicTacToe

describe Board do
  let (:new_board) {described_class.new}

  describe '#initialize' do
    it 'creates an array of numbers from 1 to 9' do
      expect(subject.board).to eql([1, 2, 3, 4, 5, 6, 7, 8, 9])
    end

    it 'creates a counter with the value of zero' do
     expect(subject.counter).to eql(0)
    end
  end

  describe "#count" do
    it 'increases counter by one' do
      expect(subject.count).to eql(1)
    end
  end

  describe '#display_board' do
    it 'returns initial board' do
      expect(subject.display_board).to eq (['+---+---+---+',
       "| 1 | 2 | 3 |",
       '+---+---+---+',
       "| 4 | 5 | 6 |",
       '+---+---+---+',
       "| 7 | 8 | 9 |",
       '+---+---+---+'])
    end

    describe '#update_board' do

      it 'takes number of cell as an argument and updates board with O, if counter is even' do
        subject.update_board(2)
        expect(subject.board).to eql([1, "O", 3, 4, 5, 6, 7, 8, 9])
      end

      it 'takes number of cell as an argument and updates board with X, if counter is odd' do
        subject.count
        subject.update_board(2)
        expect(subject.board).to eql([1, "X", 3, 4, 5, 6, 7, 8, 9])
      end
    end

    it 'returns current status of the board' do
      subject.update_board(5)
       expect(subject.display_board).to eq (['+---+---+---+',
        "| 1 | 2 | 3 |",
        '+---+---+---+',
        "| 4 | O | 6 |",
        '+---+---+---+',
        "| 7 | 8 | 9 |",
        '+---+---+---+'])
    end
  end

  describe '#won?' do
    it 'checks for winning combinations and returns nil if game not won' do
      expect(subject.won?).not_to be true
    end

    it 'checks for winning combinations and returns the one that won the game' do
      subject.count
      subject.update_board(1)
      subject.count
      subject.update_board(4)
      subject.count
      subject.update_board(2)
      subject.count
      subject.update_board(5)
      subject.count
      subject.update_board(3)
      expect(subject.won?).to be_a(Array)
      expect(subject.won?).to eql([0,1,2])
    end
  end

  describe '#tie?' do
    it 'returns false if there is empty cells' do
      expect(subject.tie?).to be false
    end

    it 'returns true if game all cells are taken (game over)' do
      subject.count
      subject.update_board(1)
      subject.count
      subject.update_board(2)
      subject.count
      subject.update_board(3)
      subject.count
      subject.update_board(4)
      subject.count
      subject.update_board(5)
      subject.count
      subject.update_board(7)
      subject.count
      subject.update_board(6)
      subject.count
      subject.update_board(9)
      subject.count
      subject.update_board(8)
      expect(subject.tie?).to be true
    end
  end
end

