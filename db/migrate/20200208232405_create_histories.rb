class CreateHistories < ActiveRecord::Migration[6.0]
  def change
    create_table :histories do |t|
      t.integer :user_id
      t.integer :challenge_id
      t.integer :continuous_check_in
      t.string :finished
      t.string :boolean

      t.timestamps
    end
  end
end
