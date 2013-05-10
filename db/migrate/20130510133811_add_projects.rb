class AddProjects < ActiveRecord::Migration
  def change
  	create_table :projects do |t|
  		t.string :title
  		t.string :description
  		t.integer :team_id

  		t.timestamps
  	end

  	add_index :projects, :team_id
  end
end
