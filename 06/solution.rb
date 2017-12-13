a = File.read("./blocks.txt").split("\t").map(&:to_i)

most_blocks = ->(array){ array.index(array.max) }

redistribute = ->(ar,i){ blocks = ar[i]; ar[i] = 0; en = ((i+1..ar.count - 1).to_a + (0..i).to_a).cycle; while(blocks>0)do;ar[en.next]+=1;blocks -= 1;end }

hist = [a.dup]

while(hist.count == hist.uniq.count)do; redistribute.(a,most_blocks.(a)); hist += [a.dup]; end

#---
# This eventually finishes, returning a hist which has 14030 elements. The answer is this -1, or 14029.
#
# For part 2, the length of the cycle, you can get a reference to the last element of the history and check
# when this first appears by looking for its index:

last = hist.last

hist.index[last] # returns 11264

14029 - 11264
#=> 2765
