class CreateParticipateIns < ActiveRecord::Migration[6.0]
  def change
    create_table :participate_ins do |t|
      t.integer :user_id
      t.integer :challenge_id
      t.integer :continuous_check_in
      t.boolean :failed
      t.boolean :finished

      t.timestamps
    end
  end
end
