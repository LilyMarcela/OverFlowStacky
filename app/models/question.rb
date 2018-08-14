class Question < ApplicationRecord
	belongs_to :user
	has_many :answers
	has_many :comments, as: :commentable, dependent: :destroy
	has_many :votes, as: :votable, dependent: :destroy
end
