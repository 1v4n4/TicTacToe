require_relative '../lib/player.rb'
include TicTacToe

describe Player do
  describe "#initialize" do
    let(:new_player) {Player.new("Ivana", "X")}

    it 'takes two arguments and initializing name and symbol of a new class object' do
      expect(new_player.name).to eq("Ivana")
      expect(new_player.sym).to eq("X")
    end
  end
end
