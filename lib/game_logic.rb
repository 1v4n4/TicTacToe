module TicTacToe
  class Board
    attr_accessor :board

    def initialize
      @board = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    end

    def display_board
      puts '+---+---+---+'
      puts "| #{@board[0]} | #{@board[1]} | #{@board[2]} |"
      puts '+---+---+---+'
      puts "| #{@board[3]} | #{@board[4]} | #{@board[5]} |"
      puts '+---+---+---+'
      puts "| #{@board[6]} | #{@board[7]} | #{@board[8]} |"
      puts '+---+---+---+'
    end

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

    def won?
      WINNERS.detect do |i|
        @board[i[0]] == @board[i[1]] && @board[i[1]] == @board[i[2]]
      end
    end

    def tie?
      @board.none? { |a| a.is_a?(Integer) }
    end

    def clear_screen
      system 'clear'
      system 'cls'
      display_board
    end
  end
end
