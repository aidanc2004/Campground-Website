class CreateSites < ActiveRecord::Migration[7.0]
  def change
    create_table :sites do |t|
      t.string :name
      t.integer :number
      t.integer :beds

      t.timestamps
    end
  end
end
