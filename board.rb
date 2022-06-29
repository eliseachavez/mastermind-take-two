class Board

  def initialize
    @r_count = 0
    @w_count = 0
  end

  def grade(code, guess)
    reset_hint

    code_color_count = generate_code_color_count(code)
    guess_color_count = generate_guess_color_count(guess)

    count_exact_matches(code, guess, code_color_count, guess_color_count)
    count_inexact_matches(code, guess, code_color_count, guess_color_count)

    hint = create_hint
    hint
  end

  def count_exact_matches(code, guess, code_color_count, guess_color_count)
    # Count exact matches and give a red pin
    # Once counted, remove them from color counts so they aren't counted again when counting for white pins
    code.each_index do |i|
      if code[i] == guess[i]
        decrement_code_color_count(code[i], code_color_count)
        decrement_guess_color_count(guess[i], guess_color_count)
        @r_count += 1
      end
    end
  end

  def count_inexact_matches(code, guess, code_color_count, guess_color_count)
    # Get a diff to see if guess has enough colors to fill the counts for code
    code_key = ["r","o","y","g","b","p"]
    code_key.each do |color|
      color = color.to_sym
      if guess_color_count[color] > 0
        code_color_count[color].times do
          # For as many of this color that the code has, count a white pin that guess color has available
          if guess_color_count[color] >= 1
            @w_count += 1
            decrement_guess_color_count(color, guess_color_count)
          end
        end
      end
    end
  end

  def decrement_code_color_count(color, code_color_count)
    color_key = color.to_sym
    code_color_count[color_key] -= 1
  end

  def decrement_guess_color_count(color, guess_color_count)
    color_key = color.to_sym
    guess_color_count[color_key] -= 1
  end

  def generate_code_color_count(code)
    code_key = ["r","o","y","g","b","p"]
    code_color_count = {r:0,o:0,y:0,g:0,b:0,p:0}
    code_key.each do |color|
      code.each do |code_color|
        if code_color == color
          code_color_count[color.to_sym] += 1
        end
      end
    end
    code_color_count
  end

  def generate_guess_color_count(guess)
    code_key = ["r","o","y","g","b","p"]
    guess_color_count = {r:0,o:0,y:0,g:0,b:0,p:0}
    code_key.each do |color|
      guess.each do |guess_color|
        if guess_color == color
          guess_color_count[color.to_sym] += 1
        end
      end
    end
    guess_color_count
  end

  def create_hint
    hint = []
    hint.push(@r_count)
    hint.push(@w_count)
    hint
  end

  def reset_hint
    @r_count = 0
    @w_count = 0
  end

end
