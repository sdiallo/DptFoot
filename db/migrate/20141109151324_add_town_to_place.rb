class AddTownToPlace < ActiveRecord::Migration
  def change
    add_column :places, :town, :string
  end
end
