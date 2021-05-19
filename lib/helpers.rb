module TicTacToe

  require_relative '../bin/main.rb'
  def clear_screen
    system 'clear'
    system 'cls'
  end

  def invalid
    'Invalid move. Please enter a number of an available cell'
  end

  def tie_msg
    "It's a tie\n Game over!"
  end

  def empty_msg
    'You can\'t leave this empty. Please, enter you name '
  end
end
