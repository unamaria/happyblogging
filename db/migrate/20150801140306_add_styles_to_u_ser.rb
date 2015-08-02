class AddStylesToUSer < ActiveRecord::Migration
  def change
  	add_column :users, :styles, :string
  end
end
