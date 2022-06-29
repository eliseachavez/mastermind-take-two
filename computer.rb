class Computer
  include Display
  attr_reader :original_code
  attr_writer :hint

  def initialize
    @possible_codes = generate_possible_codes
    @original_code = nil
    @hint = nil
    @guess = nil
    @no_guesses_made = true
  end

  def generate_possible_codes
    code_key = ["r","o","y","g","b","p"]
    permutation = []
    code_key.repeated_permutation(4) { |num| permutation.push(num) }
    permutation
  end

  def make_code
    random_index = rand(1295)
    @original_code = @possible_codes[random_index]
  end

  def guess
    if @no_guesses_made
      first_guess
    else
      subsequent_guess_with_knuths
    end
    @guess
  end

  def first_guess
    random_index = rand(1295)
    @guess= @possible_codes[random_index]
    @no_guesses_made = false
  end

  def random_guess
    size = @possible_codes.size - 1
    random_index = rand(size).to_i
    @guess = @possible_codes[random_index]
  end

  def subsequent_guess_with_knuths
    # get the hint for the current guess
    code_hint = grade(@original_code, @guess)

    @possible_codes_iteration_set = @possible_codes.clone

    @possible_codes_iteration_set.each do |iteration_code|
      guess_hint = grade(@guess, iteration_code)
      if guess_hint != code_hint
        @possible_codes.reject!(iteration_code)
      end
    end
    puts "new size of the set of possible codes is #{@possible_codes.size}\n"

    # call random guess method once the set of possible codes has been whittled down
    random_guess
  end

end
