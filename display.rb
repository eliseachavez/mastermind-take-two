module Display

  def print_greeting
    puts "Welcome to the game, Mastermind."
  end

  def print_win_statement(turns)
    puts "Codebreaker wins! Answer was guessed in #{@turn} turns"
  end

  def print_assign_roles_prompt
    puts "\nWill computer or player be codemaker? Type c if computer or p if player.\n"\
    "The other will become codebreaker.\n"
  end

  def print_guess(guess)
    puts "Codebreaker guesses #{guess}"
  end
end
