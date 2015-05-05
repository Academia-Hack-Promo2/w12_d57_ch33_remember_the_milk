class TaskTypesController < ApplicationController
	def index
		alltaks = Task.all
		render json: alltaks
	end

	def create
		task = Task.new(permit)
		if task.valid? 
			task.save
			render json: task
		else
			render json: task.errors
		end
	end

	def permit
		params.permit(:title, :finish_date, :status, :task_type)
	end	
end
