class AddCorrectToAnswer < ActiveRecord::Migration
  def change
    add_column :answers, :correct, :integer
  end
end