module TicTacToe
  def check_name(name)
    while name.empty?
      print 'You can\'t leave this empty. Please, enter you name '
      name = gets.strip.chomp.capitalize
    end
  end

  def invalid
    puts 'Invalid move. Please enter a number of an available cell'
  end

  def tie_msg
    puts "It's a tie\n Game over!"
  end

end
