class CreateEvents < ActiveRecord::Migration[8.1]
  def change
    create_table :events do |t|
      t.string :title
      t.string :description
      t.integer :category

      t.integer :venue 
      t.datetime :start_date
      t.datetime :end_date
      t.integer :available_capacity
      t.integer :maximum_capacity
      t.integer :lifecycle_stage

      t.references :organizer, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end