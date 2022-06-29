class Computer

  def initialize
    @original_code = nil
  end

  def make_code(all_possible_codes)
    random_index = rand(1295)
    @original_code = possible_codes[random_index]
    @original_code
  end

  def guess

    ['r','g','b','p']
  end

end
