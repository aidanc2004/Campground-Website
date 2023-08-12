class AddPriceToSites < ActiveRecord::Migration[7.0]
  def change
    add_column :sites, :price, :decimal
  end
end
