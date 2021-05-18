require './lib/player'

# rubocop: disable Style/MixinUsage

include TicTacToe

# rubocop: enable Style/MixinUsage

describe Player do
  describe '#initialize' do
    let(:new_player) { Player.new('Player One', 'X') }

    it 'it takes two arguements, 1st is player and 2nd is symbol as it instatiates the player class' do
      expect(new_player.name).to eq('Player One')

      expect(new_player.sym).to eq('X')
    end
  end
end
