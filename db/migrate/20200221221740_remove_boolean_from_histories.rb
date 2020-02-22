class RemoveBooleanFromHistories < ActiveRecord::Migration[6.0]
  def change
    remove_column :histories, :boolean, :string
  end
end
