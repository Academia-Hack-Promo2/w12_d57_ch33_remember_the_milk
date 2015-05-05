class Task < ActiveRecord::Base
	validates :title, presence: true
	validates :status, length: {maximum: 10}
	validates :task_type,length: {maximum: 15}
end
