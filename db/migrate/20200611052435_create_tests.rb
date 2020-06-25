class CreateTests < ActiveRecord::Migration[5.2]
  def change
    create_table :tests do |t|
      t.integer :category_id, foreign_key: true
      t.string :title
      t.text :caption
      t.boolean :disclose
      t.string :image_id

      t.timestamps
    end
  end
end
