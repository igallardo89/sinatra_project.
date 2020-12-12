class Meditation < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :date, :meditation_length, :time_of_day
  
end
