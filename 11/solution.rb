def reset
  f = File.read("./input.txt")
  @steps = f.split(',')#.group_by{|n| n}
end

def num_steps(steps)
  groups = steps.group_by{|d| d}

  s = groups["s"] ? groups["s"].count.to_i : 0
  n = groups["n"] ? groups["n"].count.to_i : 0
  nw = groups["nw"] ? groups["nw"].count.to_i : 0
  sw = groups["sw"] ? groups["sw"].count.to_i : 0
  ne = groups["ne"] ? groups["ne"].count.to_i : 0
  se = groups["se"] ? groups["se"].count.to_i : 0
  
  # cancel out any direct opposites
  if n > s
    n = n - s
    s = 0
  elsif n < s
    s = s - n
    n = 0
  else
    s = 0
    n = 0
  end

  if nw > se
    nw = nw - se
    se = 0
  elsif nw < se
    se = se - nw
    nw = 0
  else
    se = 0
    nw = 0
  end

  if ne > sw
    ne = ne - sw
    sw = 0
  elsif nw < sw
    sw = sw - ne
    ne = 0
  else
    sw = 0
    ne = 0
  end

  # corner cases
  #CORNERS = {"n" => ["se", "sw"], "s" => ["ne", "nw"], "nw" => ["ne", "s"], "ne" => ["nw", "s"], "se" => ["sw", "n"], "sw" => ["se", "n"]}

  # sw se
  sw, se, s = corners(sw, se, s)

  # nw ne
  nw, ne, n = corners(nw, ne, n)

  # s ne se
  s, ne, se = corners(s, ne, se)

  # s nw sw
  s, nw, sw = corners(s, nw, sw)

  # n se ne
  n, se, ne = corners(n, se, ne)

  # n sw nw
  n, sw, nw = corners(n, sw, nw)

  n + s + nw + ne + sw + se
end

def corners(d1, d2, d3)
 if d1 < d2
    d2 = d2 - d1
    d3 += d1
    d1 = 0
  elsif d1 > d2
    d1 = d1 - d2
    d3 += d2
    d2 = 0
  else
    d3 += d1
    d1 = 0
    d2 = 0
  end
  [d1, d2, d3]
end

def part_2(steps)
  last_step = steps.count - 1

  (0..last_step).map do |num|
    num_steps(steps[0..num])
  end.max
end
