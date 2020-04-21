class AddColumnsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :name, :string
    add_column :users, :coins, :integer, :default => 100
    add_column :users, :chechin_number, :integer, :default => 0
    add_column :users, :challenge_number, :integer, :default => 0
  end
end
