class Chore < ApplicationRecord
	belongs_to :chores
	belongs_to :task
end
