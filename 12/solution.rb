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
