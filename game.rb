require_relative 'player.rb'
require_relative 'computer.rb'
require_relative 'board.rb'
require_relative 'display.rb'

class Game
  include Display
  attr_reader :codemaker, :codebreaker, :board

  def initialize
    @codemaker = nil
    @codebreaker = nil
    @board = Board.new
    @turn = 0
    @outcome = "#{@codebreaker} lost"
    @over = false
  end

  def play
    setup

    until @over do
      @turn += 1
      if @turn < 9
        guess = @codebreaker.make_guess
        print_guess(guess)
        @codebreaker.hint = @board.grade(@codemaker.original_code, guess)
        is_over?(@codebreaker.hint)
      else
        puts "All out of turns. The outcome of this game is: #{@outcome}"
        @over = true
      end
    end

  end

  def setup
    # Make the code
    print_greeting
    @codemaker.make_code
  end

  def assign_roles
    print_assign_roles_prompt
    answer = gets.chomp
    if answer == 'c'
      @codemaker = Computer.new
      @codebreaker = Player.new
    elsif answer == 'p'
      @codemaker = Player.new
      @codebreaker = Computer.new
    end
  end

  def is_over?(hint)
    if hint == [4,0]
      @over = true
      print_win_statement(@turn)
    else
      @over = false
    end
  end

end


