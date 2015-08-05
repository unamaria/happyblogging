class AddDefaultValueToStyles < ActiveRecord::Migration
  def change
  	change_column :users, :styles, :string, :default => "default"
  end
end
