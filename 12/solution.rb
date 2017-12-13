@data = File.read("./input.txt").split("\n")
@data = @data.map{|n| n.split(" <-> ")}
@data.each{|n| n[1] = n[1].split(", ")}

h = @data.to_h

@zeros = ["0"]

h.each{|k,v| @zeros << k if v.include?("0")}

last_count = @zeros.uniq.count

loop do
  last_count = @zeros.uniq.count
  h.each{|k,v| @zeros << k if !(v & @zeros).empty?}
  break if @zeros.uniq.count == last_count
end

# @zeros.uniq.count gives the answer to part 1

@zeros = @zeros.uniq.sort


# part 2


# take next key not included in zeros... make it a group. 
# Find all members of this group.

@ungrouped_keys = h.keys - @zeros

@groups = [@zeros]


while !@ungrouped_keys.empty? do
  @groups << []
  this_group = @groups.last
  this_group << @ungrouped_keys.first
  h.each{|k,v| this_group << k if v.include?(@ungrouped_keys.first)}
  loop do
    last_count = this_group.uniq.count
    h.each{|k,v| this_group << k if !(v & this_group).empty?}
    break if this_group.uniq.count == last_count
  end

  this_group = this_group.uniq.sort
  @ungrouped_keys = h.keys - @groups.flatten
end

# continue until all groups found
