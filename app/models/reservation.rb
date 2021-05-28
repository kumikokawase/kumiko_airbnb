class Reservation < ApplicationRecord
    belongs_to :property
    belongs_to :user
    validates :start_date, presence: true
    validates :end_date, presence: true
    belongs_to :review
end
