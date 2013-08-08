class Score < ActiveRecord::Base
	belongs_to :user
	belongs_to :category
	default_scope -> { order('created_at DESC') }
end
