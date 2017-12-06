rows = File.read("./input.txt").split("\n").map{|n| n.split("\t").map(&:to_i).sort}

answer = rows.map{|n| n.last - n.first}.inject(&:+)

#---
# part 2

answer2 = rows.map{|n| q = n.permutation(2).to_a.select{|n| n if n[0] % n[1]==0}.flatten; q[0]/q[1]}.inject(&:+)
