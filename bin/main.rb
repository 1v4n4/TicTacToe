#!/usr/bin/env ruby

board = [1, 2, 3, 4, 5, 6, 7, 8, 9]
players = []

def display_board(board)
   puts "+---+---+---+"
   puts "| #{board[0]} | #{board[1]} | #{board[2]} |"
   puts "+---+---+---+"
   puts "| #{board[3]} | #{board[4]} | #{board[5]} |"
   puts "+---+---+---+"
   puts "| #{board[6]} | #{board[7]} | #{board[8]} |"
   puts "+---+---+---+"
end

display_board(board)

puts "Welcome to Victor\'s and Ivana\'s Tic Toc"
puts 'Let the game begin!'
print 'Enter Player 1 name: '
player_one = gets.strip.chomp.capitalize
players << {'name'=>player_one, 'sym'=>'X'}

print 'Enter Player 2 name: '
player_two = gets.strip.chomp.capitalize
players << {'name'=>player_two, 'sym'=>'Y'}

puts "#{player_one} will use 'X while #{player_two} will use 'Y'"

#while !won || !board.full do


   puts "#{player_one} it's your move"
   puts "Please select an available cell from the board"
   answer = gets.chomp.to_i
   until board.include? (answer) do
      puts "Please enter a number of an available cell"
      answer = gets.chomp.to_i
   end
   board[answer-1] = 'X'

   system 'clear'
   display_board(board)

   #break if won || board.full

   puts "#{player_two} it's your move"
   puts "Please select an available cell from the board"
   answer = gets.chomp.to_i
   until board.include? (answer) do
      puts "Please enter a number of an available cell"
      answer = gets.chomp.to_i
   end
   board[answer-1] = 'O'

   system 'clear'
   display_board(board)

#end
