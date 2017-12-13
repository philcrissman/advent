
def reset

  @f = File.read("./input.txt").split("\n")
end

class Node
  class << self
    @@nodes = {}

    def find(name)
      @@nodes[name]
    end

    def all
      @@nodes.values
    end
  end

  def initialize(name, weight, childrens_names=[])
    @name = name
    @weight = weight
    @childrens_names = childrens_names
    @@nodes[name] = self
  end

  def children
    @children || []
  end

  def name
    @name
  end

  def hydrate
    @children = @childrens_names.map{|name| Node.find(name)} || []
  end

  def weight
    @weight
  end

  def full_weight
    self.weight + @children.map{|child| child.full_weight}.inject(&:+).to_i
  end
end

def parse
  reset
  @data = @f.map{|el| el.split("->")}.map{|el| el.map{|e| e.strip}}.map{|el| [el[0].split(" ").first] + [eval(el[0].split(" ").last)]  + (el[1].nil? ? [[]] : [el[1].split(", ")])}
end

def populate_tree
  @data.each do |datum|
    Node.new(datum[0], datum[1], datum[2])
  end
end

def hydrate_children
  Node.all.each{|node| node.hydrate}
end

def part2
  reset
  parse
  populate_tree
  hydrate_children
  nil
end
