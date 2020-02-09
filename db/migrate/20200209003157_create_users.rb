class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password
      t.integer :coins
      t.integer :chechin_number
      t.integer :challenge_number

      t.timestamps
    end
  end
end
