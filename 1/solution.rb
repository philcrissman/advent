numbers = File.read("./input.txt").split('').map(&:to_i)

numbers1 = numbers.dup
numbers1.unshift(numbers.pop)

@count_1 = 0

size = numbers.count
# first part
(1..(size-1)).each{|i| @count_1 += numbers[i] if numbers[1] == numbers1[i]}

# second part

numbers2 = numbers[size/2..size-1] + numbers[0..size/2-1]

@count_2 = 0

(1..(size-1)).each{|i| @count_2 += numbers[i] if numbers[1] == numbers2[i]}
