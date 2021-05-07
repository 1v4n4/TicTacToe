module TicTacToe
  class Player
    attr_accessor :name, :sym

    def initialize(name, sym)
      @name = name
      @sym = sym
    end
  end
end
