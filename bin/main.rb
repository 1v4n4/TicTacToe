#!/usr/bin/env ruby

require_relative '../lib/logic'
require_relative '../lib/helpers.rb'
require_relative '../lib/player'

# rubocop: disable Style/MixinUsage
include TicTacToe
# rubocop: enable Style/MixinUsage

new_board = TicTacToe::Board.new
puts new_board.display_board

puts "Welcome to Victor\'s and Ivana\'s Tic Toc"
puts 'Let the game begin!'
print 'Player 1, enter your name: '
name = gets.strip.chomp.capitalize

while name.empty?
  puts empty_msg
  name = gets.strip.chomp.capitalize
end

player1 = TicTacToe::Player.new(name, 'X')

print 'Player 2, enter your name: '
name = gets.strip.chomp.capitalize

while name.empty?
  puts empty_msg
  name = gets.strip.chomp.capitalize
end

player2 = TicTacToe::Player.new(name, 'O')

clear_screen
puts new_board.display_board

puts "#{player1.name} will use #{player1.sym} while #{player2.name} will use #{player2.sym}"

# rubocop: disable Style/IdenticalConditionalBranches

while !new_board.won? || !new_board.tie?

  puts "#{player1.name} it's your move"
  puts 'Please select an available cell from the board'
  answer = gets.chomp.to_i

  until new_board.board.include?(answer)
    puts invalid
    answer = gets.chomp.to_i
  end

  new_board.count
  new_board.update_board(answer)

  clear_screen
  puts new_board.display_board

  break if new_board.won? || new_board.tie?

  puts "#{player2.name} it's your move"
  puts 'Please select an available cell from the board'
  answer = gets.chomp.to_i

  until new_board.board.include?(answer)
    puts invalid
    answer = gets.chomp.to_i
  end

  new_board.count
  new_board.update_board(answer)
  break if new_board.won? || new_board.tie?

  clear_screen
  puts new_board.display_board
end

if new_board.won? && new_board.counter.odd?
  clear_screen
  puts new_board.display_board
  puts "#{player1.name} won the game!"
elsif new_board.won? && new_board.counter.even?
  clear_screen
  puts new_board.display_board
  puts "#{player2.name} won the game!"
else
  clear_screen
  puts new_board.display_board
  puts tie_msg
end
# rubocop: enable Style/IdenticalConditionalBranches
