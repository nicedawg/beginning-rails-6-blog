class GuessANumberBetweenOneAndTenJob < ApplicationJob
  queue_as :default

  class GuessedWrongNumber < StandardError; end

  retry_on GuessedWrongNumber, attempts: 8, wait: 1

  def perform(my_number)
    guessed_number = rand(1..10)

    if guessed_number == my_number
      Rails.logger.info "I guessed it! It was #{my_number}"
    else
      raise GuessedWrongNumber, "Is it #{guessed_number}? No? Hmm."
    end
  end
end
