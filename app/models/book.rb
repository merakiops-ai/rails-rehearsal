class Book < ApplicationRecord
  validates :title, :author, presence: true
  validates :rating, inclusion: { in: 1..5 }, allow_nil: true
end
