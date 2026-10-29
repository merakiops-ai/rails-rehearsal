# frozen_string_literal: true

module Types
  class BookType < Types::BaseObject
    field :id, ID, null: false
    field :title, String, null: false
    field :author, String, null: false
    field :genre, String
    field :rating, Integer
    field :published_year, Integer
  end
end
