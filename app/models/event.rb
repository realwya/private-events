class Event < ApplicationRecord
  belongs_to :creator, class_name: "User"
  has_many :attendees, through: :event_attendances, source: :event_attendee
  has_many :event_attendances, foreign_key: :attended_event_id

  validates :name, presence: true
  validates :location, presence: true
  validates :date, presence: true
end
