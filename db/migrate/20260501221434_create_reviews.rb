class CreateReviews < ActiveRecord::Migration[8.1]
  def change
    create_table :reviews do |t|
      t.references :user, null: false, foreign_key: true
      t.references :administrator, null: false, foreign_key: true
      t.references :event, null: false, foreign_key: true
      t.float :calification
      t.string :comment

      t.timestamps
    end
  end
end
