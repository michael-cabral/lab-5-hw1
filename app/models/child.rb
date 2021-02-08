class Child < ApplicationRecord
    has_many :chores
    has_many :tasks, through: :chores
end
