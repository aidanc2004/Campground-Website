# TODO: make sure end date is after start date

class Reservation < ApplicationRecord
  belongs_to :site

  validates :name, presence: true
  validates :start, presence: true
  validates :end, comparison: { greater_than: :start }
end
