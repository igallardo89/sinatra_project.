class AddMeditationsToUsers < ActiveRecord::Migration
  def change
    add_column :meditations, :user_id, :integer
  end
end
