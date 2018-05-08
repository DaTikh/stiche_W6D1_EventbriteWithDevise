class Event < ApplicationRecord

  belongs_to :creator, class_name: "User"
  has_many :event_attendees
  has_many :attendees, through: :event_attendees

  validates :price,           presence: true
  validates :title,           presence: true
  validates :description,     presence: true
  validates :place,           presence: true

end
