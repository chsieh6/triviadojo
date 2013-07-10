class ChangeNameFieldInCategory < ActiveRecord::Migration
  def change
  	rename_column :categories, :content, :name
  end
end
