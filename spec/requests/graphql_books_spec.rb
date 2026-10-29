require "rails_helper"

RSpec.describe "GraphQL books query", type: :request do
  it "returns books, best rated first" do
    Book.create!(title: "Low", author: "A", rating: 2)
    Book.create!(title: "High", author: "B", rating: 5)

    post "/graphql", params: { query: "{ books { title rating } }" }, as: :json

    titles = JSON.parse(response.body).dig("data", "books").map { |b| b["title"] }
    expect(titles).to eq(["High", "Low"])
  end
end
