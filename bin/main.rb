#!/usr/bin/env ruby

require './lib/board'
require './lib/logic'
require './lib/player'

# board = [1, 2, 3, 4, 5, 6, 7, 8, 9]
count = 0

new_board = TicTacToe::Board.new
new_board.display_board

puts "Welcome to Victor\'s and Ivana\'s Tic Toc"
puts 'Let the game begin!'
print 'Player 1, enter your name: '
name = gets.strip.chomp.capitalize

while name.empty?
  print 'You can\'t leave this empty. Please, enter you name '
  name = gets.strip.chomp.capitalize
end

player1 = TicTacToe::Player.new(name, 'X')

print 'Player 2, enter your name: '
name = gets.strip.chomp.capitalize
while name.empty?
  print 'You can\'t leave this empty. Please, enter you name '
  name = gets.strip.chomp.capitalize
end

player2 = TicTacToe::Player.new(name, 'O')

puts "#{player1.name} will use #{player1.sym} while #{player2.name} will use #{player2.sym}"

while !new_board.won? || !new_board.tie?

  puts "#{player1.name} it's your move"
  puts 'Please select an available cell from the board'
  answer = gets.chomp.to_i

  until new_board.board.include?(answer)
    puts 'Invalid move. Please enter a number of an available cell'
    answer = gets.chomp.to_i
  end
  new_board.board[answer - 1] = 'X'
  count += 1
  
  new_board.clear_screen

  break if new_board.won? || new_board.tie?

  puts "#{player2.name} it's your move"
  puts 'Please select an available cell from the board'
  answer = gets.chomp.to_i
  until new_board.board.include?(answer)
    puts 'Invalid move. Please enter a number of an available cell'
    answer = gets.chomp.to_i
  end
  new_board.board[answer - 1] = 'O'
  count += 1
  break if new_board.won? || new_board.tie?

  new_board.clear_screen

end

if new_board.won? && count.odd?
  new_board.clear_screen
  puts "#{player1.name} won the game!"
elsif new_board.won? && count.even?
  new_board.clear_screen
  puts "#{player2.name} won the game!"
else
  new_board.clear_screen
  puts "It's a tie\n Game over!"
end
