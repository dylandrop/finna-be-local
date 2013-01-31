class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.string :name
      t.text :body
      t.string :seller_email
      t.integer :zip

      t.timestamps
    end
  end
end
