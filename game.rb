require_relative 'player.rb'
require_relative 'computer.rb'
require_relative 'board.rb'
require_relative 'display.rb'

class Game
  include Display

  def intialize
    @codemaker = nil
    @codebreaker = nil
    @possible_codes = generate_possible_codes
    @board = nil
    @turn = 0
    @outcome = "#{@codebreaker} lost"
    @over = false
  end

  def play
    @turn = 0
    assign_roles
    setup

    until @over do
      @turn += 1
      if @turn < 9
        guess = @codebreaker.guess
        hint = @board.grade(guess)
        is_over?(hint)
      else
        puts "All out of turns. The outcome of this game is: #{@outcome}"
        @over = true
      end
    end

  end

  def setup
    # Make the code
    code = @codebreaker.make_code(@all_possible_codes)

    # Initialize the board with that code
    @board = Board.new(code)
  end

  def assign_roles
    puts "Will computer or player be codemaker? Type c if computer or p if player. The other will become codebreaker."
    answer = gets.chomp
    if answer == 'c'
      @codemaker = Computer.new
      @codebreaker = Player.new
    elsif answer == 'p'
      @codemaker = Player.new
      @codebreaker = Computer.new
    end
  end

  def generate_possible_codes
    code_key = ["r","o","y","g","b","p"]
    permutation = []
    code_key.repeated_permutation(4) { |num| permutation.push(num) }
    permutation
  end

  def is_over?(hint)
    if hint == [4,0]
      @over = true
    else
      @over = false
    end
  end

end


