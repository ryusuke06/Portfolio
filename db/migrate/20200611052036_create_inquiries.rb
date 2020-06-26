class CreateInquiries < ActiveRecord::Migration[5.2]
  def change
    create_table :inquiries do |t|
      t.references :user, foreign_key: true
      t.string :title
      t.text :content
      t.integer :demand
      t.integer :read

      t.timestamps
    end
  end
end
