require 'pry'
require 'minitest/autorun'

class Sorter
  def sort(test_letter)
    letter = test_letter.downcase.gsub(/\s/, '')

    1.upto(letter.size - 1) do |i|
      0.upto(i) do |j|
        char = letter[i]

        if char < letter[j]
          i.downto(j+1) do |k|
            letter[k] = letter[k -1]
          end
        letter[j] = char
        end
      end
    end
    letter
  end

  def sort_easy(letter)
    letter.downcase.tr("/\s.*/", "").chars.sort.join("")
  end
end

class TestSorter < Minitest::Test
  def setup
    @sorter = Sorter.new
  end

  def test_sorter
    assert_equal("aaiijjmnu", @sorter.sort("I am    jiajun"))
  end

  def test_sorter_easy
    assert_equal("aaiijjmnu", @sorter.sort_easy("I am    jiajun"))
  end
end