require 'minitest/autorun'
require 'pry'
require 'csv'

class MonthlyWeatherReport
  def self.print
    File.readlines("./monthly_weather.dat").each do |line|
      next unless line =~ /^\s*\d+/
      values = line.split

      spread = (values[1].chomp('*').to_i - values[2].chomp('*').to_i).abs
      puts "Day #{values[0]}: #{spread}"
    end
  end
end

MonthlyWeatherReport.print

class Weather
  def day(number_of_day)
    reports = build_reports
    reports[number_of_day.to_s] || "day must be between 1 and 31"
  end

  def build_reports
    data = {}

    File.readlines("./monthly_weather.dat").each do |line|
      next unless line =~ /^\s*\d+/
      values = line.split

      spread = (values[1].chomp('*').to_i - values[2].chomp('*').to_i).abs
      data[values[0]] = spread
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