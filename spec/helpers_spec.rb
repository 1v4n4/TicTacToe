require './lib/helpers'
# rubocop: disable Style/MixinUsage
include TicTacToe
# rubocop: enable Style/MixinUsage

describe '#invalid' do
  it 'returns invalid move message' do
    expect(invalid).to eql('Invalid move. Please enter a number of an available cell')
  end
end

describe '#tie_msg' do
  it 'returns tie message when the game is over and there is no winner' do
    expect(tie_msg).to eql("It's a tie\n Game over!")
  end
end

describe '#empty_msg' do
  it 'returns warning message when user has entered a blank space' do
    expect(empty_msg).to eql("You can't leave this empty. Please, enter you name")
  end
end
