class User < ActiveRecord::Base
	attr_accessible :name, :team_ids

	validates :name, presence: true

	has_many :team_memberships
	has_many :teams, through: :team_memberships
end