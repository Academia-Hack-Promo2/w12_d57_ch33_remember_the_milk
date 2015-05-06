class Task < ActiveRecord::Base
	validates :title, presence: true
	validates :status, length: {maximum: 10}
	validates :task_type,length: {maximum: 15}, inclusion: { in: %w(llamada citas diligencias recordatorio),
    message: "%{value} El tipo de tarea no esta permitido" }
  belongs_to :category
end
