require_relative 'display.rb'
require_relative 'game.rb'

class Player
  include Display

  def initialize
    @name = nil
  end

  def make_code
   code = ['r','g','b','p']
   code
  end

  def guess
    ['r','g','b','p']
  end

end
