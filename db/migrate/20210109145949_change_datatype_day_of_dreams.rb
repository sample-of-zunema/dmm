class ChangeDatatypeDayOfDreams < ActiveRecord::Migration[5.2]
  def change
    change_column :dreams, :day, :date
  end
end
