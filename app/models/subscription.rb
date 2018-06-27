class Subscription < ApplicationRecord
	has_many :turns, dependent: :destroy
	belongs_to :user
end
