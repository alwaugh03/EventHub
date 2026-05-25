class AddCategoryAndVenueToEvents < ActiveRecord::Migration[8.1]
  def change
    add_reference :events, :category, null: false, foreign_key: true
    add_reference :events, :venue, null: false, foreign_key: true
  end
end
