class Chore < ApplicationRecord
	belongs_to :child
	belongs_to :task

	validates_date :due_on#, :only_date => true

	scope :alphabetical, -> { order('name') }
	scope :chronological, -> { order('due_on') }
	scope :by_task, -> { joins(:task).order('tasks.name') }
	scope :past, -> { where('due_on < ?', Date.today) }
	scope :upcoming, -> { where('due_on >= ?', Date.today) }
	scope :pending, -> { where('completed = ?', false) }
	scope :done, -> { where('completed = ?', true) }

	def status
      self.completed ? "Completed" : "Pending"
    end
end
