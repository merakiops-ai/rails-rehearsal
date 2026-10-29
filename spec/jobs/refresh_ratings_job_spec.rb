require "rails_helper"

RSpec.describe RefreshRatingsJob do
  it "never calls the data provider without an API key" do
    book = Book.create!(title: "T", author: "A")
    expect(described_class.perform_now(book.id)).to eq(:skipped)
  end
end
