#!/usr/bin/env ruby

require './lib/game_logic'
require './lib/helpers'
require './lib/player'

# rubocop: disable Style/MixinUsage
include TicTacToe
# rubocop: enable Style/MixinUsage
count = 0

new_board = TicTacToe::Board.new
new_board.display_board

puts "Welcome to Victor\'s and Ivana\'s Tic Toc"
puts 'Let the game begin!'
print 'Player 1, enter your name: '
name = gets.strip.chomp.capitalize

check_name(name)

player1 = TicTacToe::Player.new(name, 'X')

print 'Player 2, enter your name: '
name = gets.strip.chomp.capitalize
check_name(name)

player2 = TicTacToe::Player.new(name, 'O')

puts "#{player1.name} will use #{player1.sym} while #{player2.name} will use #{player2.sym}"

new_board.clear_screen

# rubocop: disable Lint/Void
# rubocop: disable Style/IdenticalConditionalBranches

clear = new_board.clear_screen

while !new_board.won? || !new_board.tie?

  puts "#{player1.name} it's your move"
  puts 'Please select an available cell from the board'
  answer = gets.chomp.to_i

  until new_board.board.include?(answer)
    invalid
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
    invalid
    answer = gets.chomp.to_i
  end
  new_board.board[answer - 1] = 'O'
  count += 1
  break if new_board.won? || new_board.tie?

  new_board.clear_screen
end

if new_board.won? && count.odd?
  clear
  puts "#{player1.name} won the game!"
elsif new_board.won? && count.even?
  clear
  puts "#{player2.name} won the game!"
else
  clear
  tie_msg
end
# rubocop: enable Lint/Void
# rubocop: enable Style/IdenticalConditionalBranches
