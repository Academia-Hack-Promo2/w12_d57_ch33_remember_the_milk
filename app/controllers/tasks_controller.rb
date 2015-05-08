class TasksController < ApplicationController
	def index
		task = nil
		if params[:category].nil?
			task = Task.all
		else
			task = Task.where("category_id" => params[:category].to_i)
		end
		render json: task		
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

	def finish
		exist = Task.exists?(params[:id].to_i)
		if exist 
			status = {"status" => "listo"}
			task = Task.update(params[:id], status)
			render json: task
		else
			render json: {"Error" => "Error 404 La Tarea no existe"}
		end
	end
	def status_list
		status = params[:status]
		case status
			when "finish"
				task = Task.where("status" => "listo")
				render json: task		
			when "pending"
				task = Task.where("status" => "pendiente")
				render json: task	
			else
				render json: {"Error" => "El estatus no existe"}
		end
				
	end

	private

	def permit
		params.permit(:title, :finish_date, :status, :task_type, :category_id)
	end	
end
