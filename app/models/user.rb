class User < ApplicationRecord
  has_many :created_events, foreign_key: :creator_id, class_name: "Event"
  has_many :event_attendances, foreign_key: :event_attendee_id
  has_many :attended_events, through: :event_attendances


  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true, length: {in: 2..20 }, uniqueness: true
end
