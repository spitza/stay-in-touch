class Meeting < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true
  validates :invitee, presence: true
  validates :frequency, presence: true
  validates :work_or_play, presence: true
  default_scope -> { order(created_at: :desc) }
end