class MemberFavourites < ActiveRecord::Migration[5.2]
  def change
    create_table :member_favourites do |t|
      t.integer :user_id
      t.integer :favourite_id
      t.string :title
      t.string :favorite_type
      t.string :score

      t.timestamps null: false
    end
  end
end
