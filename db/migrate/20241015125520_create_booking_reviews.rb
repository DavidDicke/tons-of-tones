class CreateBookingReviews < ActiveRecord::Migration[7.1]
  def change
    create_table :booking_reviews do |t|
      t.text :content
      t.integer :rating
      t.references :user, null: false, foreign_key: true
      t.references :booking, null: false, foreign_key: true

      t.timestamps
    end
  end
end
