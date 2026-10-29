# Pretend external data job, standing in for a paid data API (Zano's would be Phyllo).
# In development it never calls out: no API key, no cost.
class RefreshRatingsJob < ApplicationJob
  queue_as :default

  def perform(book_id)
    book = Book.find(book_id)

    if ENV["RATINGS_API_KEY"].blank?
      Rails.logger.info("[RefreshRatingsJob] skipped for book #{book.id}: no RATINGS_API_KEY (development)")
      return :skipped
    end

    # A real call to the data provider would go here.
    :called
  end
end
