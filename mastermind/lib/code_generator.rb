class CodeGenerator
  require 'pry'
# Generate a color sequence with any combination of red, greed, blue, or yellow
# 4 array length 4 colors
# 6 array length 5 colors
# 8 array length 6 colors


  def code_generator(colors, length)
      answer =  Array.new(length).map do
      colors.sample
    end.join
  end
end



# colors = ["g","r","b","y"]
# possible color combinations aka generated code
# colors_beginner = ["r","g","b","y"]
# colors_intermediate = ["r","g","b","y","p"]
# colors_advanced = ["r","g","b","y","p","o"]
#
# code = CodeGenerator.new
# p code.code_generator(colors_4,6)
#
# code_beginner = CodeGenerator.new.code_generator(["r","g","b","y"],4)
