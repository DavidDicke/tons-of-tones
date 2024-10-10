class Instrument < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :description, presence: true
  validates :category, presence: true
  validates :address, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0 }
end
