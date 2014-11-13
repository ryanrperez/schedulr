class Event < ActiveRecord::Base
  has_many :participants
  has_many :days

  validates :event_name, presence: true, allow_blank: false
  validates :start_time, presence: true
  validates :end_time, presence: true
end