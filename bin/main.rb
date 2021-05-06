#!/usr/bin/env ruby

board = [1, 2, 3, 4, 5, 6, 7, 8, 9]
players = []

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
print 'Enter Player 1 name: '
name = gets.strip.chomp.capitalize

while name.empty?
  print 'You can\'t leave this empty. Please, enter you name '
  name = gets.strip.chomp.capitalize
end
player_one = name
players << { 'name' => player_one, 'sym' => 'X' }

print 'Enter Player 2 name: '
name = gets.strip.chomp.capitalize
while name.empty?
  print 'You can\'t leave this empty. Please, enter you name '
  name = gets.strip.chomp.capitalize
end

player_two = name
players << { 'name' => player_two, 'sym' => 'Y' }

puts "#{player_one} will use 'X while #{player_two} will use 'Y'"

# rubocop: disable Metrics/PerceivedComplexity
# rubocop: disable Metrics/CyclomaticComplexity
def won?(board)
  (board[0] == board[1] && board[1] == board[2]) ||
    (board[3] == board[4] && board[4] == board[5]) ||
    (board[6] == board[7] && board[7] == board[8]) ||
    (board[0] == board[3] && board[3] == board[6]) ||
    (board[1] == board[4] && board[4] == board[7]) ||
    (board[2] == board[5] && board[5] == board[8]) ||
    (board[0] == board[4] && board[4] == board[8]) ||
    (board[2] == board[4] && board[4] == board[6])
end

def clear_screen(arr)
  system 'clear'
  system 'cls'
  display_board(arr)
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
  puts "It's a tie?\n Game over!"
end

# rubocop: enable Metrics/PerceivedComplexity
# rubocop: enable Metrics/CyclomaticComplexity
