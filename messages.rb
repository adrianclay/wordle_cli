# frozen_string_literal: true

# All messages outputted by application
class Messages
  # I like these library of messages, they remind me a bit of internationalisation.
  # If you've not seen that before, here's a library which makes managing lots of these types of
  # messages easier https://github.com/ruby-i18n/i18n
  def welcome_message
    print "Welcome to Wordle.\n"
  end

  def rules
    print "Guess a five-letter word in 5 attempts. Each time you guess, you are told which of your chosen letters are in the target word, and whether they are in the right place. \n"
    print "2 = this letter is in this position \n"
    print "1 = this letter is in the target word but not this position \n"
    print "0 = this letter is either not in the target word, or is not in the target \n"
  end

  def request_word
    print 'Please guess a 5 letter word: '
  end

  def winning_message(text)
    puts "congratulations the target word was #{text}"
  end

  def out_of_lives
    print 'Sorry you ran out lives'
  end

  def incorrect_word_length
    print 'Your guess was not 5 letters long. Try again'
  end
end
