module TicTacToe
  attr_reader :board, :counter

  class Board
    def initialize
      @board = [1, 2, 3, 4, 5, 6, 7, 8, 9]
      @counter = 0
    end

    def count
      @counter += 1
    end

    def update_board(answer)
      @board[answer - 1] = if @counter.odd?
        'X'
      else
        'O'
      end
    end

    def display_board
      ['+---+---+---+',
       "| #{@board[0]} | #{@board[1]} | #{@board[2]} |",
       '+---+---+---+',
       "| #{@board[3]} | #{@board[4]} | #{@board[5]} |",
       '+---+---+---+',
       "| #{@board[6]} | #{@board[7]} | #{@board[8]} |",
       '+---+---+---+']
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
  end
end
