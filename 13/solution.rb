@data = File.read("./input.txt").split("\n").map{|n| n.split(": ").map(&:to_i)}.to_h

@firewall = Array.new(99)

@firewall = @firewall.each_with_index.map{|n,i| next if @data[i].nil?; ((0..@data[i]-1).to_a + (1..@data[i]-2).to_a.reverse).cycle}

@results = (0..98).map{|n| n if @firewall.map{|e| next if e.nil?; e.next}[n] == 0}.select{|n| n if !n.nil?}

@severity = @results.map{|i| i * @data[i]}.inject(&:+)
