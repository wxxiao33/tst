class AddPicLinkToChallenges < ActiveRecord::Migration[6.0]
  def change
    add_column :challenges, :pic_link, :string
  end
end
