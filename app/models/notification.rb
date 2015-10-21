class Notification < ActiveRecord::Base
  belongs_to :user

  validates :user_id, :message, :path, presence: true
end