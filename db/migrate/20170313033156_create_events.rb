class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :topic
      t.text :description
      t.string :location
      t.datetime :time
      t.integer :user_id
      t.integer :group_id

      t.timestamps
    end
  end
end
