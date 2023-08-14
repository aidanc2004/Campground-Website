class Reservation < ApplicationRecord
  belongs_to :site
  belongs_to :user

  validates :start, presence: true
  validates :end, comparison: { greater_than: :start }
end
