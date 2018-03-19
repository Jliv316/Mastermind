class GetUserInput

#get user input and downcase
  attr_accessor :input

  def initialize
    @input = input
  end

  def get
    @input = gets.downcase.strip
  end

end

# a = GetUserInput.new
# a.get
# a.user_input
# binding.pry
