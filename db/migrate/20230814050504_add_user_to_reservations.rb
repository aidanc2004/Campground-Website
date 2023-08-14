class AddUserToReservations < ActiveRecord::Migration[7.0]
  def change
    add_reference :reservations, :user, index: true
    add_foreign_key :reservations, :users
  end
end
