class CreateMediumDetail < ActiveRecord::Migration
  def change
    create_table :medium_details do |t|
    	t.references :user
    	t.string :username
    	t.timestamps
    end
  end
end
