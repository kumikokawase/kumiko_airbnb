class Property < ApplicationRecord
    belongs_to :user
    has_many :pictures, dependent: :destroy
    default_scope -> { order('created_at DESC')}

    validates :home_type, presence: true
    validates :room_type, presence: true
    validates :guest_count, presence: true
    validates :bedroom_count, presence: true
    validates :bathroom_count, presence: true

    validates :user_id, presence: true

    has_many :reservations, dependent: :destroy
end
