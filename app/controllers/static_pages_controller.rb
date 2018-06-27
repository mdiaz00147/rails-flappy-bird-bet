class StaticPagesController < ApplicationController
	include SessionsHelper
	before_action :check_session, only: [:contest, :game]
	before_action :check_subscription, only: [:game]

	def landing
	end
	
	def contest
		@plan = Plan.find(1)
		@turns = Turn.all.limit(10).order(score: :desc)
		@total = Subscription.all.count * 30
		@real_value = @total * 100 / 3500
	end

	def game
	end

	def practice
	end
	
	def about
	end
	private
		def check_subscription
			if current_user.subscriptions.last.status == 0
				flash[:error] = 'Your tickets have ended.'
				redirect_to contest_path
			end
		end

		def check_session
			if !current_user
				flash[:error] = 'You must sign in first'
				redirect_to root_path 
			end
		end
end
