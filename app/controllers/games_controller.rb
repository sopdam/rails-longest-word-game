require 'json'
require 'open-uri'

class GamesController < ApplicationController

  def new
    @letters = Array.new(10) { ('A'..'Z').to_a.sample }
  end

  def score
    @word = params[:word]
    url = "https://wagon-dictionary.herokuapp.com/#{@word}"
    word_serialized = open(url).read
    input = JSON.parse(word_serialized)

    def included?(guess, grid)
      guess.chars.all? { |letter| guess.count(letter) <= grid.count(letter) }
    end

    def compute_score(attempt, time_taken)
      time_taken > 60.0 ? 0 : attempt.size * (1.0 - time_taken / 60.0)
    end

    def run_game(attempt, grid, start_time, end_time)
      result = { time: end_time - start_time }

      score_and_message = score_and_message(attempt, grid, result[:time])
      result[:score] = score_and_message.first
      result[:message] = score_and_message.last

      result
    end

    def score_and_message(attempt, grid, time)
      if included?(@word.upcase, @letters)
        if english_word?(@word)
          @answer = "Congratulations! #{@word.upcase} is a valid English word!"
        elsif
          @answer = "Sorry but #{@word.upcase} does not seem to be a valid English word..."
        elsif
          @answer =
      end
    end
  end
end


