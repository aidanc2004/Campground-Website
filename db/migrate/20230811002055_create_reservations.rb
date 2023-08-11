class CreateReservations < ActiveRecord::Migration[7.0]
  def change
    create_table :reservations do |t|
      t.references :site, null: false, foreign_key: true
      t.string :name
      t.date :start
      t.date :end

      t.timestamps
    end
  end
end
