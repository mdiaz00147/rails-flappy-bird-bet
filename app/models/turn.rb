class Turn < ApplicationRecord
	belongs_to :subscription
	after_create :update_subscription
	def update_subscription
		@subscription = self.subscription
		count = @subscription.turns.count >= 3 ? @subscription.update_attribute(:status, 0) : ()
	end
end
