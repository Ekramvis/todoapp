class Project < ActiveRecord::Base
	attr_accessible :title, :description, :team_id

	validates :title, :team_id, presence: true

	belongs_to :team
	has_many :items
end