require 'open-uri'
require 'json'

class GamesController < ApplicationController

  def new
     @array_of_letter = ('a'..'z').to_a.sample(10)
  end

  def score
    @result = 0
    @attempt = params[:word].to_s.downcase.chars
    @grid = params[:letters].to_s.downcase.split(' ')
    @attempt.each do |letter|
        if (@grid.include? letter) == false
          return @result = "'#{letter}' not in #{@grid}"
        elsif english_word == false
          return @result = " #{params[:word]} is not an english word, kukoo" 
        else
          @result += 1
          index_destroy = @grid.find_index(letter)
          @grid.delete_at(index_destroy)
        end
    end
        return @result = "#{params[:word]} is an english word, your score is #{@result}"
  end

  def english_word
    url = "https://wagon-dictionary.herokuapp.com/#{params[:word]}"
    word_dictionary = open(url)
    word = JSON.parse(word_dictionary.read)
    return word['found']
  end

end
