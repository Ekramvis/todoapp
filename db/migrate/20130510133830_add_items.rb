class AddItems < ActiveRecord::Migration
  def change
  	create_table :items do |t|
  		t.string :title
  		t.string :description
  		t.boolean :completed, default: false 
  		t.integer :project_id

  		t.timestamps
  	end

  	add_index :items, :project_id
  end
end
