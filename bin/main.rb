#!/usr/bin/env ruby

require './lib/game.rb'

board = [1, 2, 3, 4, 5, 6, 7, 8, 9]
players = []

WINNERS = [
  [0, 1, 2], # 1st horizontal row
  [3, 4, 5], # 2nd horizontal row
  [6, 7, 8], # 3rd horizontal row
  [0, 3, 6], # 1st vertial column
  [1, 4, 7], # 2nd vertial column
  [2, 5, 8], # 3rd vertial column
  [6, 4, 2], # right diagonal
  [0, 4, 8] # left diagonal
].freeze

count = 0

def display_board(board)
  puts '+---+---+---+'
  puts "| #{board[0]} | #{board[1]} | #{board[2]} |"
  puts '+---+---+---+'
  puts "| #{board[3]} | #{board[4]} | #{board[5]} |"
  puts '+---+---+---+'
  puts "| #{board[6]} | #{board[7]} | #{board[8]} |"
  puts '+---+---+---+'
end

display_board(board)

puts "Welcome to Victor\'s and Ivana\'s Tic Toc"
puts 'Let the game begin!'
print 'Player 1, enter your name: '
name = gets.strip.chomp.capitalize

while name.empty?
  print 'You can\'t leave this empty. Please, enter you name '
  name = gets.strip.chomp.capitalize
end
player_one = name
players << { 'name' => player_one, 'sym' => 'X' }

print 'Player 2, enter your name: '
name = gets.strip.chomp.capitalize
while name.empty?
  print 'You can\'t leave this empty. Please, enter you name '
  name = gets.strip.chomp.capitalize
end

player_two = name
players << { 'name' => player_two, 'sym' => 'Y' }

puts "#{player_one} will use 'X while #{player_two} will use 'Y'"

def won?(board)
  WINNERS.detect do |i|
    board[i[0]] == board[i[1]] && board[i[1]] == board[i[2]]
  end
end

def tie?(arr)
  arr.none? { |a| a.is_a?(Integer) }
end

while !won?(board) || !tie?(board)

  puts "#{player_one} it's your move"
  puts 'Please select an available cell from the board'
  answer = gets.chomp.to_i
  until board.include?(answer)
    puts 'Invalid move. Please enter a number of an available cell'
    answer = gets.chomp.to_i
  end
  board[answer - 1] = 'X'
  count += 1
  clear_screen(board)

  break if won?(board) || tie?(board)

  puts "#{player_two} it's your move"
  puts 'Please select an available cell from the board'
  answer = gets.chomp.to_i
  until board.include?(answer)
    puts 'Invalid move. Please enter a number of an available cell'
    answer = gets.chomp.to_i
  end
  board[answer - 1] = 'O'
  count += 1
  break if won?(board) || tie?(board)

  clear_screen(board)

end

if won?(board) && count.odd?
  puts "#{player_one} won the game!"
elsif won?(board) && count.even?
  puts "#{player_two} won the game!"
else
  puts "It's a tie\n Game over!"
end
