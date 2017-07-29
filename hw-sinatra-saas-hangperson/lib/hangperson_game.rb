class HangpersonGame

  # add the necessary class methods, attributes, etc. here
  # to make the tests in spec/hangperson_game_spec.rb pass.

  # Get a word from remote "random word" service

  # def initialize()
  # end
  
  def initialize(word)
    @word = word
    @guesses, @wrong_guesses = '', ''
  end
  
  def guess(letter)
    if !!(letter.to_s =~ /^[\W\d_]*$/)
      raise ArgumentError
    end
    letter.downcase!
    if !!(@guesses.include? letter) ||
      !!(@wrong_guesses.include? letter)
      false
    else
      if !!(@word.include? letter) then
        @guesses << letter
      else
        @wrong_guesses << letter
      end
      true
    end
  end
  
  def word_with_guesses
    @word.gsub(/[^#{@guesses}#{@wrong_guesses}_]/,'-')
  end
  
  def check_win_or_lose
    if @wrong_guesses.length >= 7
      return :lose
    end
    if !!(@word =~ /[#{@guesses}_]{#{@word.length}}/)
      return :win
    end
    return :play
  end
  
  attr_accessor :word, :guesses, :wrong_guesses
  
  def self.get_random_word
    require 'uri'
    require 'net/http'
    uri = URI('http://watchout4snakes.com/wo4snakes/Random/RandomWord')
    Net::HTTP.post_form(uri ,{}).body
  end

end
