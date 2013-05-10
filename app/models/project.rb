class Project < ActiveRecord::Base
	attr_accessible :title, :description, :team_id

	validates :title, presence: true
	# add back in validation for team_id once implemented

	belongs_to :team
	has_many :items
end