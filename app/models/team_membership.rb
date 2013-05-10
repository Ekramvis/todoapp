class TeamMembership < ActiveRecord::Base
	attr_accessible :user_id, :team_id

	validates :user_id, :team_id, presence: true

	belongs_to :user
	belongs_to :team
end