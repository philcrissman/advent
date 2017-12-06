def reset
  @instructions = File.read("./input.txt").split("\n").map(&:to_i)
  @count = 0
end

def evaluate(i)
  # assume i is the current index.
  steps = @instructions[i]
  # read the jump value. Move that many step forward or backward
  new_i = i + steps
  # increment the value at i

  @instructions[i] += 1

  # return the new index to evaluate
  new_i
end

def evaluate_b(i)
  # assume i is the current index.
  steps = @instructions[i]
  # read the jump value. Move that many step forward or backward
  new_i = i + steps
  # increment the value at i

  if steps >= 3
    @instructions[i] -= 1
  else
    @instructions[i] += 1
  end

  # return the new index to evaluate
  new_i
end

#---

def escape(part = 1)
  reset

  current_index = 0

  # evaluate the current_index
  while !@instructions[current_index].nil?
    if part == 1
      new_index = evaluate(current_index)
    elsif part == 2
      new_index = evaluate_b(current_index)
    end


    @count += 1

    current_index = new_index
  end

  puts "You escaped in #{@count} steps!"
end
