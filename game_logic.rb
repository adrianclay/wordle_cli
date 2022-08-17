# frozen_string_literal: true

# Checks whether letters are in target word, Validates guesses and whether a game has won.
class GameLogic
  def check_guess(guess, target)
    # I'd avoid overwriting variable values, especially when the value is changed a lot.
    # It looks like you're spliting the guess into the individual letters.  `guess_letters` and `target_letters`
    # might be more appropriate.
    guess = guess.split('')
    target = target.split('')

    guess.each_with_index.map do |letter, _index|
      # Extracting these checks into variables might help with readability.
      if target.include?(letter) && guess.find_index(letter) == target.find_index(letter)
        2
      elsif target.include?(letter) && guess.find_index(letter) != target.find_index(letter)
        1
      else
        0
      end
    end
  end

  def validate_guess(guess)
    # You can shorten this line even more. (I won't tell you how :devil:)
    true if guess.length == 5
  end

  # The way this method is used from wordle.rb feels very clunky:
  # @game_logic.win?(@game_logic.check_guess(guess, target_word))
  # As a user I need to call check_guess before calling win? which is painful.
  def win?(word)
    word.all? { |letter| letter == 2 }
  end
end
