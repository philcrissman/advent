@f = File.read("./input.txt")
@a = @f.split('')
# remove all "escaped" (!) characters
@a.each_with_index{|n, i| if n == "!"; @a[i] = nil; @a[i+1] = nil; end}
@a = @a.compact

# remove garbage
@garbage = false
@i = 0
@garbage_count = 0
while (@i < 10187) do
  if @garbage
    if @a[@i] == ">"
      @garbage = false
      @a[@i] = nil
    else
      @garbage_count += 1
      @a[@i] = nil
    end
  elsif @a[@i] == "<"
    @garbage = true
    @a[@i] = nil
  end
  @i += 1
end
@b = @a.compact

# remove commas, change our {} to [] to make it easier to work with, add commas back in the 
# appropriate places
str = @b.join
str.gsub!(",", "")
str.gsub!("{","[")
str.gsub!("}","]")
str.gsub!("][", "],[")

stream = eval(str) # make the string an actual array

# calculate the score!
def score(a,value); return value if a.count == 0; value + a.map{|n| score(n, value+1)}.inject(&:+); end

@part_1 = score(stream, 1)
