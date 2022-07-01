module Display

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

  def print_goodbye
    puts "Goodbye."
  end

  def print_make_code_prompt
    puts "\nCodemaker, there are six possible colors. There are four colors in a code.\n"\
    "Type r for red, o for orange, y for yellow, g for green, b for blue, and p for pink.\n"
  end

  def print_make_guess_prompt
    puts "\nCodebreaker, there are six possible colors and four colors in a code.\n"\
    "Type r for red, o for orange, y for yellow, g for green, b for blue, and p for pink.\n"\
    "And example code is 'rgbp', red-green-blue-pink.\n\n"
  end

  def print_lose_statement
    puts "All out of turns. The outcome of this game is: #{@outcome}"
  end

  def print_wrong_chars_error
    puts "\nERROR. The characters you typed were incorrect. You will be re-prompted.\n"
  end

  def print_computer_has_chosen
    puts "\nComputer has created a code.\n"
  end

end
