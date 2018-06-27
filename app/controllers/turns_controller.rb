class TurnsController < ApplicationController
	skip_before_action :verify_authenticity_token
	

	def create
		@subscription 	= current_user.subscriptions.last
		turn 			= @subscription.turns.create(start: (Time.at(params['start_time'].to_i / 1000.0) ), end: (Time.at(params['final_time'].to_i / 1000.0) ), score: params['final_score'])
		render json: turn
	end

	def check
		@turns = 3 - current_user.subscriptions.last.turns.count
		# flash[:error] = 'Your tickets have ended. Buy more tickets to play again!'
		render json: @turns
	end


end
