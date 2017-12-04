@file = File.read("./input.txt")
@phrases = @file.split("\n")

def valid(phrase)
  words = phrase.split(" ")
  words == words.uniq
end

def how_many
  @phrases.select{|phrase| phrase if valid(phrase)}.count
end

def reorder(word)
  word.split('').sort.join('')
end

def valid_2(phrase)
  words = phrase.split(" ")
  words = words.map{|word| reorder(word)}
  words == words.uniq
end

def how_many_2
  @phrases.select{|phrase| phrase if valid_2(phrase)}.count
end
