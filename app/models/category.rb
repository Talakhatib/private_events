class Category < ApplicationRecord
  belongs_to :user

  has_many :event_categories,dependent: :destroy
  has_many :events,through: :event_categories,source: :event

  validates :title, presence: true
end
