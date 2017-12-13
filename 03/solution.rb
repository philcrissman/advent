# Solution to the first part lay in realizing that the bottom right corner of each 
# ring surrounding the origin was the square of each successive odd number starting
# with 3; so, the bottom right corner, going diagonally down, would be 9, 25, 49, 
# 81, 121, etc. If the first ring is 1, then the ring each bottom corner belongs to 
# is (sqrt(n)-1)/2. 
#
# So... my number was 325489.
#
# The closest square root greater than my number is 571**2, or 326041. That the end 
# of the 285th ring around the origin. Because the rings last number is 571**2, each
# edge has 571 squares, inclusive.
#
# 326041 - 325489 is 552, which is less than the total number of squares in the
# bottom edge, meaning my number is in the bottom row of the 285th ring. 
#
# If we were on the center square, then getting to the origin would take exactly 
# 285 steps (stepping up each ring till we get to 1).
#
# So how far are we from center? 
#
# center is 285, so 552 - 285 = 267.
#
# From there, we need to go the 285 steps to the origin, to 267 + 285 gets us 552 
# again, which is the answer.
#
# For the second part, I found the integer sequence defined by the problem: 
#
# https://oeis.org/A141481/b141481.txt 
#
# The answer to part 2 is the first number on the above list which is greater than
# 325489.
