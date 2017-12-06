require 'rubygems'
require 'rspec'
require 'byebug'

class Fib
  def initialize
    @memo = [0, 1]
  end

  def fib_non_dp n # takes order n time, order 1 space
    return n if n < 2

    a, b = 0, 1

    for i in 2..n
      a, b = b, a + b
    end
    b
  end

  def fib_memorization n # order n, takes order n space 
    return @memo[n] unless @memo[n].nil?
    @memo[n] = fib(n-1) + fib(n-2)
  end

  def fib_tabulation n # order n, takes order n space
    memo = [0, 1]

    (2..n).each {|i| memo[i] = memo[i-1] + memo[i-2] }

    memo[n]
  end

  def fib_recursive n # order 2 ^ n
    return n if n < 2
    fib(n-1) + fib(n-2)
  end

  alias_method :fib, :fib_memorization
end

describe 'fib' do
  it 'returns 2 for 3' do
    expect(Fib.new.fib(3)).to eq 2
  end

  it 'returns 3 for 4' do
    expect(Fib.new.fib(4)).to eq 3
  end

  it 'returns 5 for 5' do
    expect(Fib.new.fib(5)).to eq 5
  end

  it 'returns 8 for 6' do
    expect(Fib.new.fib(6)).to eq 8
  end

  it 'returns 0 for 0' do
    expect(Fib.new.fib(0)).to eq 0
  end

  it 'returns 1 for 1' do
    expect(Fib.new.fib(1)).to eq 1
  end

  it 'returns 1 for 2' do
    expect(Fib.new.fib(2)).to eq 1
  end
end
