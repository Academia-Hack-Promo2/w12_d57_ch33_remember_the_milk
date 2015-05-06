class TasksController < ApplicationController
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
		if aux 
			task = Task.find((params[:id].to_i))
			render json: task.to_json
		else
			render json: {"Error" => "Error 404 La Tarea no existe"}
		end

	end
	def destroy
		exit =  Task.exists?((params[:id].to_i))
		if exit
			task = Task.find((params[:id].to_i))
			task.delete
			render json: task.to_json
		else
			render json: {"Error" => "Error 404 La Tarea no existe"}
		end
	end

	def update
		exist = Task.exists?(params[:id].to_i)
		if exist
			task = Task.update(params[:id].to_i, permit)
			render json: task
			
		else
			render json: {"Error" => "Error 404 La Tarea no existe"}
		end
	end

def permit
	params.permit(:title, :finish_date, :status, :task_type)
end	
end
