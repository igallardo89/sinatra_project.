class CreateMeditations < ActiveRecord::Migration
  def change
    create_table :meditations do |t|
      t.datetime :date
      t.integer :meditation_length
      t.string  :time_of_day
    end
  end
end
