#Welcome to MASTERMIND
class Runner
  require_relative 'get_user_input'
  require_relative 'printer'
  require_relative 'code_generator'
  require 'pry'
  attr_reader :printer, :user_input, :code
  attr_accessor :colors, :length

  def initialize
    @user_input = GetUserInput.new
    @printer = Printer.new
  end



  def start
    printer.welcome
    printer.play_instructions_quit
    until quit?
      option_screen
      if play?
        start_game
      elsif instructions?
        instructions
      elsif cheat_code?
        cheat_and_win
      elsif quit?
        printer.quit_message
      else
        printer.invalid_input
      end
    end
  end

private

def start_game
  game = Game.new(@user_input, @printer, code)
  game.game_setup
end


  def option_screen
    printer.enter_input
    @user_input.get
    @user_input.input
  end

  def play?
    @user_input.input == "p" || @user_input.input == "play"
  end

  def instructions?
    @user_input.input == "i" || @user_input.input == "instructions"
  end

  def quit?
    @user_input.input == "q" || @user_input.input == "quit"
  end

  def cheat_code?
    @user_input.input == "cheaters are gonna cheat"
  end



  def cheat_and_win
    printer.cheat
  end
end
