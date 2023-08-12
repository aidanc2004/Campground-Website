class Site < ApplicationRecord
  has_many :reservations

  validates :name, presence: true
  validates :number, presence: true
  validates :beds, presence: true
  validates :price, presence: true
end
