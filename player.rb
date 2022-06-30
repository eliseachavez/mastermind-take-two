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
  end

  def generate_possible_codes
    code_key = ["r","o","y","g","b","p"]
    permutation = []
    code_key.repeated_permutation(4) { |num| permutation.push(num) }
    permutation
  end

  def make_code
   #type it in
   #make sure it's in set of possible codes
    @original_code = ['r','g','b','p']
    @original_code
  end

  def make_guess
    ['r','g','b','p']
  end

end
