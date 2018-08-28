class Question < ApplicationRecord
	belongs_to :user
	has_many :answers
	has_many :comments, as: :commentable, dependent: :destroy
	has_many :votes, as: :votable

	def score
		votes.count
	end

	def voted?(current_user)
		votes.exists?(user: current_user)
	end
end
