class Participant < ActiveRecord::Base
  belongs_to :event
  has_many :timeblocks

  validates :name, presence: true, allow_blank: false
end