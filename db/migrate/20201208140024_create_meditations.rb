class CreateMeditations < ActiveRecord::Migration
  def change
    create_table :meditations do |t|
      t.datetime :Date
      t.integer :Meditation_Length
      t.string  :Time_of_Day
    end
  end
end
