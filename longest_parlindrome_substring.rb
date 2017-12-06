# require 'minitest/autorun'
require 'pry'
require 'byebug'

# 'a b   c d   e f g'
# 'a b c d e' l = 2, last index = 3 
def longest_parlindrom_substring string
  return string if string.length < 2

  length = string.length
  memo = {}

  1.upto(length) do |sub_length|
    0.upto(length - sub_length) do |start_i|

      last_i = start_i + sub_length - 1
      indice = [start_i, last_i]

      next unless string[start_i] == string[last_i]

      memo[indice] = 1 if start_i == last_i
      memo[indice] = 2 if start_i + 1 == last_i

      indice_of_sub_substring = [start_i+1, last_i-1]
      
      if memo.has_key?(indice_of_sub_substring)
          memo[indice] = 2 + memo[indice_of_sub_substring]
      end
    end
  end
  indice = memo.key(memo.values.max)
  string[indice[0]..indice[1]]
end


# def longest_parlindrom_substring string
#   return string if string.length < 2

#   length = string.length

#   memo = {}

#   1.upto(length) do |substring_length|
#     0.upto(length - substring_length) do |start_index|

#       last_index = start_index + substring_length - 1
#       indice     = [start_index, last_index]
#       substring  = string[start_index..last_index]

#       # debugger

#       next unless string[start_index] == string[last_index]

#       if substring.size == 1
#         memo[indice] = 1
#       elsif substring.size == 2
#         memo[indice] = 2
#       else
#         if memo.has_key?([start_index+1, last_index-1])
#           puts "Trying to access something #{[start_index+1, last_index-1]}"
#           memo[indice] = 2 + memo[[start_index+1, last_index-1]] 
#         end
#       end
#     end
#   end
#   # memo
#   indice = memo.key(memo.values.max)
#   string[indice[0]..indice[1]]
# end

p longest_parlindrom_substring 'cbbd'


# def longest_parlindrom_substring s  
#   return s if s.size == 1

#   memo = {}

#   last_index_of_string = s.size - 1
#   longest_length = 1
#   indice = [0, 0]

#   last_index_of_string.downto(0) do |start_index|
#     memo[[start_index, start_index]] = 1

#     for last_index in start_index+1..last_index_of_string
#       if s[start_index] == s[last_index]
#         if last_index - start_index == 1
#           memo[[start_index, last_index]] = 2

#           if longest_length < 2
#             indice = [start_index, last_index]
#             longest_length = 2
#           end

#         elsif memo.has_key? [start_index+1, last_index-1]
#           indice = [start_index, last_index]
#           longest_length = memo[indice] = 2 + memo[[start_index+1, last_index-1]]
#         end
#       end
#     end
#   end
#   # longest_substring_indice = memo.key(memo.values.max)
#   s[indice[0]..indice[1]]
# end


# def longest_parlindrom_substring s  
#   return s if s.size == 1

#   memo = {}

#   last_index_of_string = s.size - 1
#   longest_length = 1
#   indice = [0, 0]

#   last_index_of_string.downto(0) do |start_index|
#     memo[[start_index, start_index]] = 1

#     for last_index in start_index+1..last_index_of_string
#       if s[start_index] == s[last_index]
#         if last_index - start_index == 1
#           memo[[start_index, last_index]] = 2

#           if longest_length < 2
#             indice = [start_index, last_index]
#             longest_length = 2
#           end

#         elsif memo.has_key? [start_index+1, last_index-1]
#           indice = [start_index, last_index]
#           longest_length = memo[indice] = 2 + memo[[start_index+1, last_index-1]]
#         end
#       end
#     end
#   end
#   # longest_substring_indice = memo.key(memo.values.max)
#   s[indice[0]..indice[1]]
# end

# def longest_parlindrom_substring s  
#   return s if s.size == 1

#   memo = {}

#   last_index_of_string = s.size - 1
#   longest_length = 1
#   indice = [0, 0]

#   last_index_of_string.downto(0) do |start_index|
#     memo[[start_index, start_index]] = true

#     for last_index in start_index+1..last_index_of_string
#       if s[start_index] == s[last_index]
#         if last_index - start_index == 1
#           memo[[start_index, last_index]] = true

#           if longest_length < 2
#             indice = [start_index, last_index]
#             longest_length = 2
#           end

#         elsif memo.has_key? [start_index+1, last_index-1]
#           indice = [start_index, last_index]
#           memo[indice] = true
#         end
#       end
#     end
#   end
#   # longest_substring_indice = memo.key(memo.values.max)
#   s[indice[0]..indice[1]]
# end

# def longest_parlindrom_substring string

#   return string if string.size == 1

#   memo = {}

#   last_index_of_string = string.size - 1

#   last_index_of_string.downto(0) do |start_index|
#     memo[[start_index, start_index]] = 1

#     for last_index in start_index+1..last_index_of_string
#       if string[start_index] == string[last_index]
#         if last_index - start_index == 1
#           memo[[start_index, last_index]] = 2
#         elsif memo.has_key? [start_index+1, last_index-1]
#           memo[[start_index, last_index]] = memo[[start_index+1, last_index-1]] + 2
#         end
#       end
#     end
#   end
#   longest_substring_indice = memo.key(memo.values.max)
#   string[longest_substring_indice[0]..longest_substring_indice[1]]
# end


# def longest_parlindrom_substring string
#   return 1 if string.size == 1

#   memo = {}

#   last_index_of_string = string.size - 1

#   last_index_of_string.downto(0) do |start_index|
#     memo[[start_index, start_index]] = 1

#     for last_index in start_index+1..last_index_of_string
#       if string[start_index] == string[last_index]
#         if memo.has_key? [start_index+1, last_index-1]
#           p "checking memo: #{[start_index+1, last_index-1]}\n\n"
#           memo[[start_index, last_index]] = memo[[start_index+1, last_index-1]] + 2
#         else
#           # current substring is not parlindrom
#         end
#       else
#         # current substring is not parlindrom, go to the next substring in which the first character is string[start_index]
#       end
#     end
#   end
#   p memo
# end

# p longest_parlindrom_substring '"mwwfjysbkebpdjyabcfkgprtxpwvhglddhmvaprcvrnuxifcrjpdgnktvmggmguiiquibmtviwjsqwtchkqgxqwljouunurcdtoeygdqmijdympcamawnlzsxucbpqtuwkjfqnzvvvigifyvymfhtppqamlgjozvebygkxawcbwtouaankxsjrteeijpuzbsfsjwxejtfrancoekxgfyangvzjkdskhssdjvkvdskjtiybqgsmpxmghvvicmjxqtxdowkjhmlnfcpbtwvtmjhnzntxyfxyinmqzivxkwigkondghzmbioelmepgfttczskvqfejfiibxjcuyevvpawybcvvxtxycrfbcnpvkzryrqujqaqhoagdmofgdcbhvlwgwmsmhomknbanvntspvvhvccedzzngdywuccxrnzbtchisdwsrfdqpcwknwqvalczznilujdrlevncdsyuhnpmheukottewtkuzhookcsvctsqwwdvfjxifpfsqxpmpwospndozcdbfhselfdltmpujlnhfzjcgnbgprvopxklmlgrlbldzpnkhvhkybpgtzipzotrgzkdrqntnuaqyaplcybqyvidwcfcuxinchretgvfaepmgilbrtxgqoddzyjmmupkjqcypdpfhpkhitfegickfszermqhkwmffdizeoprmnlzbjcwfnqyvmhtdekmfhqwaftlyydirjnojbrieutjhymfpflsfemkqsoewbojwluqdckmzixwxufrdpqnwvwpbavosnvjqxqbosctttxvsbmqpnolfmapywtpfaotzmyjwnd"'

# 'a  b  c  d  e'

# class TestChop < Minitest::Test
#   def test_longest_parlindrom_substring
    # assert_equal(1, longest_parlindrom_substring('a'))
    # assert_equal(1, longest_parlindrom_substring('ab'))
    # assert_equal(0,  chop(1, [1]))

    # assert_equal(0,  chop(1, [1, 3, 5]))
    # assert_equal(1,  chop(3, [1, 3, 5]))
    # assert_equal(2,  chop(5, [1, 3, 5]))
    # assert_equal(-1, chop(0, [1, 3, 5]))
    # assert_equal(-1, chop(2, [1, 3, 5]))
    # assert_equal(-1, chop(4, [1, 3, 5]))
    # assert_equal(-1, chop(6, [1, 3, 5]))

    # assert_equal(0,  chop(1, [1, 3, 5, 7]))
    # assert_equal(1,  chop(3, [1, 3, 5, 7]))
    # assert_equal(2,  chop(5, [1, 3, 5, 7]))
    # assert_equal(3,  chop(7, [1, 3, 5, 7]))
    # assert_equal(-1, chop(0, [1, 3, 5, 7]))
    # assert_equal(-1, chop(2, [1, 3, 5, 7]))
    # assert_equal(-1, chop(4, [1, 3, 5, 7]))
    # assert_equal(-1, chop(6, [1, 3, 5, 7]))
    # assert_equal(-1, chop(8, [1, 3, 5, 7]))
#   end
# end
