class CreateResults < ActiveRecord::Migration[5.2]
  def change
    create_table :results do |t|
      t.references :test, foreign_key: true
      t.string :title
      t.text :caption
      t.string :youtube_url
      t.integer :pattern

      t.timestamps
    end
  end
end
