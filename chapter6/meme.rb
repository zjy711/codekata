require 'minitest/autorun'

class Meme
  def i_can_has_cheezburger?
    "OHAI!"
  end

  def will_it_blend?
    "YES!"
  end

  def morning
    "Good morning!"
  end

  def goodnight
    "Night night!"
  end
end

class TestMeme < Minitest::Test
  def setup
    @meme = Meme.new
  end

  def test_morning
    assert_equal "Good morning!", @meme.morning
  end

  def test_goodnight
    assert_equal "Night night!", @meme.goodnight    
  end
end

describe Meme do
  before do
    @meme = Meme.new
  end

  describe "when asked about burger" do
    it "must respond positively" do
      @meme.i_can_has_cheezburger?.must_equal "OHAI!"
    end
  end

  describe "when asked about bleding possibilities" do
    it "won't say no" do
      @meme.will_it_blend?.wont_match /^no/i
    end
  end
end

