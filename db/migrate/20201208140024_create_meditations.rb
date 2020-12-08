class CreateMeditations < ActiveRecord::Migration
  def change
    create_table :meditations do |t|
      t.integer :MeditationTime
    end
  end
end
