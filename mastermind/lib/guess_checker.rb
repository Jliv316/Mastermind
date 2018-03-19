class GuessChecker
  require 'pry'

# check for position and check for number of matching elements

  def compare_code_to_guess(code, guess)
    if code == guess
      number_of_matching_positions = code.length
    else
      number_of_matching_positions = position_checker(code, guess)
      number_of_matching_elements = element_checker(code, guess)
    end
    return [number_of_matching_positions,number_of_matching_elements]
  end

    def element_checker(code, guess)
      code_array = code.chars
      guess_array = guess.chars

      code_array.uniq.count do |letter|
          guess_array.include?(letter)
        end
    end


  def position_checker(code, guess)
  code_array = code.chars
  guess_array = guess.chars
  index = 0
  number_of_matching_positions = 0
    code_array.each do |letter|
      if (guess_array[index] == letter)
        number_of_matching_positions += 1
      end
      index += 1
    end
  return number_of_matching_positions
  end
end
# code = "rrgb"
# input = "rgby"
# guess = GuessChecker.new.element_checker(code,input)
#
# binding.pry
