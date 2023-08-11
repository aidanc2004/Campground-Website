class Reservation < ApplicationRecord
  belongs_to :site

  validates :name, presence: true
  validates :start, presence: true
  validates :end, presence: true
end
