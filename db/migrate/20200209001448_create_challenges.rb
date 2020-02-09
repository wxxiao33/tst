class CreateChallenges < ActiveRecord::Migration[6.0]
  def change
    create_table :challenges do |t|
      t.string :name
      t.string :category
      t.text :description
      t.integer :coins
      t.integer :duration
      t.integer :participant_number
      t.integer :failed_number
      t.timestamp :deadline

      t.timestamps
    end
  end
end
