# frozen_string_literal: true

require_relative 'game_logic'
require_relative 'messages'

# Game flow
class Wordle
  attr_accessor :game_logic, :messages
  attr_reader :TARGET_WORDS

  # Nice constant, moving this to the boundry of your code (as you've done) helps
  # make changing which target words get used really easy.
  TARGET_WORDS = %w[About Alert Argue Beach Above Found Guess Doubt Every Frame Guest
                    Dozen Exact Frank Guide Draft Exist Fraud Happy Drama Extra Fresh Harry Drawn Faith Front Heart Dream].freeze

  def initialize
    @game_logic = GameLogic.new
    @messages = Messages.new
  end

  # The responsibilities of this method are a bit muddied and it has gotten very long.
  # - Tracking a counter.
  # - Printing out messages.
  # - Collecting guesses from the user.
  # My first thought is that introduing a state machine object
  #  might be helpful to manage the rules of the game.
  # Try aggressively getting the methods down to less than 10 lines, and then try 5!
  def play
    @messages.welcome_message
    @messages.rules
    @messages.request_word
    counter = 1
    target_word = TARGET_WORDS.sample.downcase
    guess = gets.chomp

    if @game_logic.validate_guess(guess)
      until @game_logic.win?(@game_logic.check_guess(guess, target_word)) || counter == 5
        print @game_logic.check_guess(guess, target_word)
        puts "\n"
        @messages.request_word
        guess = gets.chomp.downcase
        @game_logic.check_guess(guess, target_word)
        counter += 1
      end

      if @game_logic.win?(@game_logic.check_guess(guess, target_word))
        @messages.winning_message(target_word)
        print @game_logic.check_guess(guess, target_word)
      elsif counter == 5
        @messages.out_of_lives
        puts "\n"
        print @game_logic.check_guess(guess, target_word)
        puts "\n"
        puts "the word was: #{target_word}"
      end

    else
      @messages.incorrect_word_length
      puts "\n\n"
      play
    end
  end
end

wordle = Wordle.new

wordle.play
