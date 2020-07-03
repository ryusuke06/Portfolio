class AddPositionToDetails < ActiveRecord::Migration[5.2]
  def change
    add_column :details, :position, :integer
  end
end
