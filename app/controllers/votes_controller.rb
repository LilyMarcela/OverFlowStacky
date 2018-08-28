class VotesController < ApplicationController
	before_action :authenticate_user!
	

	def index
		@votes = Vote.all
	end


	def create
		@vote = @votable.votes.create(user_id: current_user.id)
		if @vote.save
		  flash[:success] = 'Tu voto ha sido guardado'
		end
	end

	def destroy
    @vote = @votable.votes.take.try(:destroy)
  end

		

end