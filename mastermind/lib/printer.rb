class Printer

  def welcome
    puts "Welcome to Mastermind"
  end

  def play_instructions_quit
    puts "Would you like to (p)lay, read the (i)nstructions, or (q)uit?"
  end

  def select_difficulty
    puts "Please select difficulty: (b)egginner, (i)ntermediate, or (a)dvanced"
  end

  def quit_message
    puts "Goodbye!"
  end

  def enter_input
    puts "Enter command:"
  end

  def invalid_input
    puts "You have entered an invalid input! Please try again."
  end

  def win_statement(code, number_of_guesses, minutes, seconds)
    puts "Congratulations! You guessed the sequence #{code} in #{number_of_guesses} guesses over #{minutes} minutes and #{seconds} seconds. Do you want to (p)lay again or (q)uit?"
  end

  def beginner_instructions
    puts "I have generated a beginner sequence with 4 elements made up of: (r)ed,
    (g)reen, (b)lue, and (y)ellow. Use (q)uit at any time to end the game."
  end

  def intermediate_instructions
    puts "I have generated an intermediate sequence with 6 elements made up of: (r)ed,
    (g)reen, (b)lue, (y)ellow and (p)urple. Use (q)uit at any time to end the game."
  end

  def advanced_instructions
    puts "I have generated an advanced sequence with 8 elements made up of: (r)ed,
    (g)reen, (b)lue, (y)ellow, (p)urple, and (o)range. Use (q)uit at any time to end the game."
  end

  def make_guess
    puts "What's your guess?"
  end

  def secret(stuff)
    puts "Look what you did you cheater! Fine, here's the answer...#{stuff}"
  end

  def results(user_input, number_of_matching_elements, number_of_matching_positions, number_of_guesses)
    puts "#{user_input} has #{number_of_matching_elements} of the correct elements with #{number_of_matching_positions} in the correct position. You've taken #{number_of_guesses} guesses."
  end

  def input_too_short(code_length)
    puts "Too few characters. Guess needs to be of character length #{code_length}"
  end

  def input_too_long(code_length)
    puts "Too many characters. Guess needs to be of character length #{code_length}"
  end
end
