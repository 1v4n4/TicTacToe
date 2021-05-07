module TicTacToe
  class Player
    attr_accessor :name, :sym

    def initialize(name, sym)
      @name = name
      @sym = sym
    end

    def check_name(name)
      while name.empty?
        print 'You can\'t leave this empty. Please, enter you name '
        name = gets.strip.chomp.capitalize
      end
    end
  end
end
