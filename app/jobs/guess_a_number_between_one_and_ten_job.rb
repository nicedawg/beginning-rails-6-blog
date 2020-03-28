class GuessANumberBetweenOneAndTenJob < ApplicationJob
  queue_as :default

  def perform(my_number)
    guessed_number = rand(1..10)

    if guessed_number == my_number
      Rails.logger.info "I guessed it! It was #{my_number}"
    else
      Rails.logger.error "Is it #{guessed_number}? No? Hmm."
    end
  end
end
