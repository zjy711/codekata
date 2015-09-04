require 'minitest/autorun'
require 'pry'
require 'csv'

class Weather
  def initialize
    @data = build_data
  end

  def day(number_of_day)
    return "day must be between 1 and 31" unless valid_day?(number_of_day)
    @data[number_of_day.to_s]
  end

  def valid_day?(number_of_day)
    !number_of_day.to_s.match(/^([1-9]|(1|2)([0-9])|30)$$/).nil?
  end

  def build_data
    data = {}

    file   = File.read("./monthly_weather.dat")
    report = CSV.parse(file, headers: true, col_sep: ' ').delete_if { |row| row.empty? }

    report.each do |row|
      data[row['Dy']] = (row['MxT'].gsub(/\*/, '').to_i - row['MnT'].gsub(/\*/, '').to_i).abs
    end

    data
  end
end

describe Weather do
  before do
    @weather = Weather.new
  end

  describe "#day" do
    it "it returns correct value for day 1" do
      @weather.day(1).must_equal 29
    end

    it "it returns correct value for day 1" do
      @weather.day(2).must_equal 16
    end

    it "it returns correct value for day 3" do
      @weather.day(9).must_equal 54
    end

    it "it returns correct value for day 1" do
      @weather.day(26).must_equal 33
    end

    it "it returns invalid day for day 0" do
      @weather.day(0).must_equal  "day must be between 1 and 31"
    end

    it "it returns invalid day for day 32" do
      @weather.day(32).must_equal "day must be between 1 and 31"
    end

    it "it returns invalid day for non integer number" do
      @weather.day('abc').must_equal "day must be between 1 and 31"
    end

    it "it returns invalid day for float number day" do
      @weather.day(12.3).must_equal "day must be between 1 and 31"
    end
  end
end