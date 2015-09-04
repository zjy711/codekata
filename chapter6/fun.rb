words = File.readlines('/Users/jiajunzhu/code/kata/chapter6/words').delete_if {|e| e.strip.empty?}
words.map! {|w| w.chop }

output = []

while !words.empty? do
  word = words.first
  line = word
  words = words.slice(1..-1)

  words.each_with_index do |w, i|
    if word.downcase.chars.sort == w.downcase.chars.sort
      line += " #{w}"
      words[i] = ""
    end
  end

  output << line
  words.delete_if {|w| w.empty? }.shift
end

puts output


output = File.read('/Users/jiajunzhu/code/kata/chapter6/output', 'jiajunzhu')



# unless words.empty?
#   word = words.first
#   (1..(words.size - 1)).each do |w|

#   end
# end
# 0.upto(words.size - 1).each do |round|
#   word = words[round]
#   words.slice(round, ).each do |w|
#   end
# end
