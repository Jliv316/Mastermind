# Mastermind runner class


class Game
  require_relative 'runner'
  require_relative 'guess_checker'
  require_relative 'time_stamp'
  require 'pry'

  attr_reader :printer, :user_input, :guess_storage, :win_statement, :code,
              :results
  attr_accessor :colors



  def initialize(input_from_runner, printer_from_runner, code)
    @user_input = input_from_runner
    @printer = printer_from_runner
    @code = code
    @guess_storage = []
    @results = []
    @win_statement = 4
    @time_stamp = TimeStamp.new
    @colors = ["r","y","g","b"]
  end


  def game_setup
    printer.select_difficulty
    game_difficulty
  end

  def play
    @time_stamp.start
    until win? || quit?
      printer.make_guess
      @user_input.get
      @user_input.input
      case
      when quit?            then printer.quit_message
      when secret_code?     then printer.secret(@code)
      when invalid_colors?  then printer.invalid_input
      when input_too_short? then printer.input_too_short(@code.length)
      when input_too_long?  then printer.input_too_long(@code.length)
      when win?
        @time_stamp.stop
        time_elapsed = @time_stamp.elapsed_time
        @guess_storage << @user_input.input
        printer.win_statement(@code, guess_storage.length, time_elapsed[0], time_elapsed[1])
      else
        store_and_compare
        printer.results(@user_input.input, @results[1], @results[0], @guess_storage.length)
      end
    end
  end

private

  def game_difficulty
    printer.enter_input
    @user_input.get
    @user_input.input
    if @user_input.input == "b" || @user_input.input == "beginner"
       start_game_beginner
       @win_statement = 4
    elsif @user_input.input == "i" || @user_input.input == "intermediate"
       start_game_intermediate
       @win_statement = 6
    elsif @user_input.input == "a" || @user_input.input == "advanced"
       start_game_advanced
       @win_statement = 8
    else
      printer.invalid_input
    end
  end

  def instructions_based_on_difficulty
    printer.select_difficulty
    printer.enter_input
    @user_input.get
    @user_input.input
      case
      when @user_input.input == "b" || @user_input.input == "beginner"       then  printer.beginner_instructions
      when @user_input.input == "i" || @user_input.input == "intermediate"   then  printer.intermediate_instructions
      when @user_input.input == "a" || @user_input.input == "advanced"       then  printer.advanced_instructions
      else                      printer.invalid_input
    end
  end

  def start_game_beginner
    printer.beginner_instructions
    @code = CodeGenerator.new.code_generator(["r","g","b","y"],4)
    game = Game.new(@user_input, @printer, @code)
    game.play
  end

  def start_game_intermediate
    printer.intermediate_instructions
    @code = CodeGenerator.new.code_generator(["r","g","b","y","p"],6)
    game = Game.new(@user_input, @printer,@code)
    game.play
  end

  def start_game_advanced
    printer.advanced_instructions
    @code = CodeGenerator.new.code_generator(["r","g","b","y","p","o"],8)
    game = Game.new(@user_input, @printer,@code)
    game.play
  end

  def quit?
    @user_input.input == "q" || @user_input.input == "quit"
  end

  def invalid_colors?
    input = @user_input.input.chars

    colors_beginner = ["r","y","g","b"]
    colors_intermediate = ["r","y","g","b","p"]
    colors_advanced = ["r","y","g","b","p","o"]

    if @code.length == 4
      colors_beginner.each do |color|
        input.delete(color)
      end
    elsif @code.length == 6
      colors_intermediate.each do |color|
        input.delete(color)
      end
    elsif @code.length == 8
      colors_advanced.each do |color|
        input.delete(color)
      end
    end
        !input.empty?
  end



  def input_too_short?
    @user_input.input.length < @code.length
  end

  def input_too_long?
    @user_input.input.length > @code.length
  end

  def win?
    @results = GuessChecker.new.compare_code_to_guess(@code, @user_input.input)
    @results[0] == code.length
  end

  def store_and_compare
    @guess_storage << @user_input.input
    @results = GuessChecker.new.compare_code_to_guess(@code, @user_input.input)
  end

  def secret_code?
     @user_input.input == 'cheat'
  end



end
