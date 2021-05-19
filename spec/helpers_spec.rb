require_relative '../lib/helpers.rb'
# rubocop: disable Style/MixinUsage
include TicTacToe
# rubocop: enable Style/MixinUsage

describe '#invalid' do
  it 'outputs invalid move message' do
    expect(invalid).to eql('Invalid move. Please enter a number of an available cell')
  end
end

describe '#tie_msg' do
  it 'outputs message when result is draw' do
    expect(tie_msg).to eql("It's a tie\n Game over!")
  end
end

describe '#empty_msg' do
  it 'outputs warning message to enter a name, if name is empty' do
    expect(empty_msg).to eql('You can\'t leave this empty. Please, enter you name ')
  end
end
