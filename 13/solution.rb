class ScanningArray
  include Enumerable

  attr_reader :direction
  attr_reader :size
  attr_reader :enum

  def initialize(size, direction = "+")
    @size = size
    @direction = direction
    @enum = Array.new(size){""}.to_enum
  end

  def toggle
    if @direction == "+"
      @direction = "-"
    elsif @direction = "-"
      @direction = "+"
    end
  end

  def next
    
  end
end
