class Reservation < ApplicationRecord
  belongs_to :site
  belongs_to :user

  validates :start, presence: true
  validates :end, comparison: { greater_than: :start }

  # Number of nights reserved
  def get_nights
    (self.end - self.start).to_i
  end

  # Total cost of reservation based on number of site nightly rate, nights, tax rate
  def get_total
    nights = self.get_nights
    tax_rate = 1.15 # TODO: Move this into config for adding other rates
    price = self.site.price

    # Get reservation total and round it to two decimal places
    total = (nights * price * tax_rate).round(2, :half_even);
  end
end
