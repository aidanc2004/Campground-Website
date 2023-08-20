module ReservationHelper
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
