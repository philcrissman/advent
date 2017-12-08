def reset
  @instructions = File.read("./input.txt").split("\n")
  @vars = []
  @vals = []
end

def run_instructions(instr = @instructions)
  instr.each do |instruction|
    instruction = instruction.split(" ")
    unless @vars.include?("@#{instruction[0]}")
      instance_variable_set(:"@#{instruction[0]}", 0)
      @vars << "@#{instruction[0]}"
    end
    unless @vars.include?("@#{instruction[4]}")
      instance_variable_set(:"@#{instruction[4]}", 0)
      @vars << "@#{instruction[4]}"
    end


    instruction[0] = "@#{instruction[0]}"
    instruction[4] = "@#{instruction[4]}"
    instruction[1] = "+=" if instruction[1] == "inc"
    instruction[1] = "-=" if instruction[1] == "dec"
    line = instruction.join(" ")

    eval(line)
    @vals << instance_variable_get(:"#{instruction[0]}")
    @vals << instance_variable_get(:"#{instruction[4]}")
  end
end
