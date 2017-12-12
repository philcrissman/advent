@list = (0..255).to_a

# input.txt
@inputs = [83,0,193,1,254,237,187,40,88,27,2,255,149,29,42,100].join(',').split(//).map(&:ord) + [17, 31, 73, 47, 23]

@skip_size = 0

@current_position = 0

def twist(input)
  # rotate to the current_position
  @list.rotate!(@current_position)
  # reverse the input size
  if input > 0
    @list = @list[0..input-1].reverse + @list[input..-1]
  end

  # unrotate list
  @list.rotate!(-1 * @current_position)

  @current_position = (@current_position + input + @skip_size) % @list.size

  @skip_size += 1
end

def round
  @inputs.each{|n| twist(n)}
end

64.times{ round }

# slice the array
hexes =  @list.each_slice(16).map{|slice| slice.inject(&:^) }

puts hexes.map{|n| n.to_s(16).rjust(2, ?0)}.join

