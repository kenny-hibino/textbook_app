class Textbook < ActiveRecord::Base
  belongs_to :user
  belongs_to :subject
  belongs_to :course

  validates :title, presence: true, length: { maximum: 70 }
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0, less_than: 1000 } 
  validates :subject_id, presence: true

  default_scope -> { order(created_at: :desc) }

  # Query all textbook with a given string included in either title or description.
  scope :search, ->(search) { where("title LIKE :search OR description LIKE :search", search: "%#{search}%") }
end
