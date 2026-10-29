require "rails_helper"

RSpec.describe Book, type: :model do
  it "needs a title and an author" do
    book = Book.new
    expect(book).not_to be_valid
    expect(book.errors[:title]).to be_present
    expect(book.errors[:author]).to be_present
  end

  it "only accepts ratings from 1 to 5" do
    expect(Book.new(title: "T", author: "A", rating: 6)).not_to be_valid
    expect(Book.new(title: "T", author: "A", rating: 5)).to be_valid
  end
end
