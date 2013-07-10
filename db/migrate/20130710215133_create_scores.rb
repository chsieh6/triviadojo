class CreateScores < ActiveRecord::Migration
  def change
    create_table :scores do |t|
      t.integer :number_correct
      t.integer :number_attempted
      t.integer :user_id
      t.integer :category_id

      t.timestamps
    end
    add_index :scores, [:user_id, :category_id]
  end
end
