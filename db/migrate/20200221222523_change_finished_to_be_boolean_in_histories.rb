class ChangeFinishedToBeBooleanInHistories < ActiveRecord::Migration[6.0]
  def change
    change_column :histories, :finished, 'boolean USING CAST(finished AS boolean)'
  end
end
