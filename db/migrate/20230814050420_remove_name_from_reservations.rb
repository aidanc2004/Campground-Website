class RemoveNameFromReservations < ActiveRecord::Migration[7.0]
  def change
    remove_column :reservations, :name, :string
  end
end
