require_relative 'display.rb'
require_relative 'game.rb'

class Player
  include Display

  attr_reader :original_code, :hint, :guess
  attr_writer :hint

  def initialize
    @possible_codes = generate_possible_codes
    @original_code = nil
    @hint = nil
    @guess = nil
  end

  def generate_possible_codes
    code_key = ["r","o","y","g","b","p"]
    permutation = []
    code_key.repeated_permutation(4) { |num| permutation.push(num) }
    permutation
  end

  def make_code
    print_make_code_prompt
    ans = gets.chomp

    if ans.length == 4 && has_correct_chars(ans)
      @original_code = ans.chars
    else
      @original_code = nil
      make_code
    end
  end

  def make_guess
    print_make_guess_prompt
    @guess = gets.chomp

    if @guess.length == 4 && has_correct_chars(@guess)
      @guess.chars
    else
      @guess = nil
      make_guess
    end
  end

  def has_correct_chars(code)
    alphabet = ['r','o','y','g','b','p']
    right_chars = true
    code.each_char do |c|
      unless alphabet.include?(c)
        right_chars = false
      end
    end
    right_chars
  end

end
