require 'rubygems'
require 'rspec'
require 'set'

def find_two_movies flight_length, movie_lengths
  return false if movie_lengths.size == 1

  desired_second_movie_lengths = Set.new

  movie_lengths.each do |length|
    return true if desired_second_movie_lengths.include? length

    desired_second_movie_lengths << flight_length - length
  end
  false
end

def find_two_movies_nested_loops flight_length, movie_lengths
  return false if movie_lengths.size == 1

  for first_movie_index in 0..movie_lengths.size-1
    for second_move_index in first_movie_index+1..movie_lengths.size-1
      return true if movie_lengths[first_movie_index] + movie_lengths[second_move_index] == flight_length
    end
  end

  false
end

describe 'find_two_movies' do
  context 'when there are two movies whose sum equals flight length' do
    it 'return false when there are many qualified movie combinations' do
      movie_lengths = [120, 180, 200, 100]
      expect(find_two_movies(300, movie_lengths)).to be true
    end

    it 'return false when there are more than two movies' do
      movie_lengths = [120, 140, 200]
      expect(find_two_movies(260, movie_lengths)).to be true
    end

    it 'return false when there are two movies' do
      movie_lengths = [120, 140]
      expect(find_two_movies(260, movie_lengths)).to be true
    end
  end

  context 'when there are not two movies whose sum equals flight length' do
    it 'return false when there is one movie whose length is half flight length' do
      movie_lengths = [120, 140, 100]
      expect(find_two_movies(200, movie_lengths)).to be false
    end

    it 'return false when there are less than two movies' do
      movie_lengths = [120, 140, 200]
      expect(find_two_movies(100, movie_lengths)).to be false
    end

    it 'return false when there are two movies' do
      movie_lengths = [120, 140]
      expect(find_two_movies(100, movie_lengths)).to be false
    end

    it 'return false when there is one movie' do
      movie_lengths = [120]
      expect(find_two_movies(100, movie_lengths)).to be false
    end
  end
end
