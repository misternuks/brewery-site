class CreateBeers < ActiveRecord::Migration[7.1]
  def change
    create_table :beers do |t|
      t.string :name
      t.string :style
      t.integer :price
      t.text :description
      t.boolean :new
      t.boolean :limited
      t.integer :count
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
