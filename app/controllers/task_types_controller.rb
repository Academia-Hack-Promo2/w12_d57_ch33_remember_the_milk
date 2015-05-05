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

	def show
		aux = Task.exists?((params[:id].to_i))
	 	if aux == true
	 		task = Task.find((params[:id].to_i))
	 		render json: task.to_json
	 	else
	 		render json: {"Error" => "Error 404 La Tarea no existe"}
	 	end
			
	end

	def permit
		params.permit(:title, :finish_date, :status, :task_type)
	end	
end
