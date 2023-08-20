# TODO: Move these to methods on Reservation class

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

  # Makes sure two reservations don't overlap
  def doesnt_overlap?(reservation)
    site = reservation.site
    
    site.reservations.each do |r|
      # If this is the same reservation
      if reservation == r
        next
      end
      # NOT <= and >= because a user can check in the same day another checks out
      if reservation.start < r.end && reservation.end > r.start
        flash[:alert] = "Site is not avaliable during these days"
        return false
      end
    end
    
    true
  end
end
