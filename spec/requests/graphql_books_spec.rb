require "rails_helper"

RSpec.describe "GraphQL books query", type: :request do
  it "returns books sorted by title (A–Z)" do
    Book.create!(title: "Zebra", author: "A", rating: 5)
    Book.create!(title: "Apple", author: "B", rating: 2)

    post "/graphql", params: { query: "{ books { title rating } }" }, as: :json

    titles = JSON.parse(response.body).dig("data", "books").map { |b| b["title"] }
    expect(titles).to eq(["Apple", "Zebra"])
  end

  it "returns each book's published year" do
    Book.create!(title: "Dune", author: "Herbert", rating: 5, published_year: 1965)

    post "/graphql", params: { query: "{ books { title publishedYear } }" }, as: :json

    book = JSON.parse(response.body).dig("data", "books").first
    expect(book["publishedYear"]).to eq(1965)
  end
end
