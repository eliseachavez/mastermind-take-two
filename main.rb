require_relative 'game.rb'
require_relative 'display.rb'
require_relative 'player.rb'
require_relative 'computer.rb'
require_relative 'board.rb'

def intro
  puts "\nWelcome to Mastermind. Would you like to play? Type y for yes and anything else otherwise"
  answer = gets.chomp
  if answer == 'y'
    game = Game.new
    game.assign_roles
    game.play
  else
    print_goodbye
  end
end

intro

