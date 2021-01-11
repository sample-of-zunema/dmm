class AddStartTimeToDreams < ActiveRecord::Migration[5.2]
  def change
    add_column :dreams, :start_time, :datetime
  end
end
