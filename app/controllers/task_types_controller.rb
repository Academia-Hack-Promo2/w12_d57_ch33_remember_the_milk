class TaskTypesController < ApplicationController
	def index
		alltaks = Task.all
		render json: alltaks
	end

	
end
