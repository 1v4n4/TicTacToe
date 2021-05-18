require './lib/player'

# rubocop: disable Style/MixinUsage

include TicTacToe

# rubocop: enable Style/MixinUsage

describe Player do
  describe '#initialize' do
    let(:new_player) { Player.new('Player One', 'X') }

    it 'the class takes one arguement as player name' do
      expect(new_player.name).to eq('Player One')
    end

    it 'the class takes one arguement as symbol that is asigned to the player created' do
      expect(new_player.sym).to eq('X')
    end
  end
end
