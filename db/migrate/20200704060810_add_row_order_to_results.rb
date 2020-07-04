class AddRowOrderToResults < ActiveRecord::Migration[5.2]
  def change
    add_column :results, :row_order, :integer
  end
end
