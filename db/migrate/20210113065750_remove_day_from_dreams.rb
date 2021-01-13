class RemoveDayFromDreams < ActiveRecord::Migration[5.2]
  def change
    remove_column :dreams, :day, :datetime
  end
end
