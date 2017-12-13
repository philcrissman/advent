def reset
  @f = File.read("./input.txt")
  parse(@f)
end

def parse(input)
  @ar = input.split("\n")
  @ar = @ar.map{|el| el.split("->")}.map{|el| el.map(&:strip)}.map{|el| [el[0].split(" "), el[1]]}.map{|el| el.compact}.map{|el| [[[el[0][0],eval(el[0][1])]].to_h,el[1].nil? ? [] : el[1].split(", ")]}
  @data = @ar.to_h
end

def part1
  reset
  keys = @data.map{|k,v| k if !v.empty?}.compact.map{|el| el.keys}.flatten
  values = @data.map{|k,v| v if !v.empty?}.compact.flatten.uniq
  keys - values
end

class Node
  def initialize(name, weight, children=[])
    @name = name
    @weight = weight
    @children = children
  end

  class << self
    @nodes = {}

  end
end

def nodify

end
