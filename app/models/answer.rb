class Answer < ApplicationRecord
	
	belongs_to :question
	belongs_to :user
	has_many :comments, as: :commentable, dependent: :destroy
	has_many :votes, as: :votable, dependet: :destroy
end