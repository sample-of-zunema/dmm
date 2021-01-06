class CreateDreams < ActiveRecord::Migration[5.2]
  def change
    create_table :dreams do |t|
      t.integer :user_id
      t.integer :comment_id
      t.datetime :day
      t.integer :emotion
      t.string :title
      t.text :body

      t.timestamps
    end
  end
end
