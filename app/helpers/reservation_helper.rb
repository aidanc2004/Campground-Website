module ReservationHelper
  # Number of nights reserved
  def get_nights(reservation)
    (reservation.end - reservation.start).to_i
  end

  # Total cost of reservation based on number of site nightly rate, nights, tax rate
  def get_total(reservation)
    nights = get_nights(reservation)
    tax_rate = 1.15 # TODO: Move this into config for adding other rates
    price = reservation.site.price

    # Get reservation total and round it to two decimal places
    total = (nights * price * tax_rate).round(2, :half_even);
  end
end
