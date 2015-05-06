class CategoriesController < ApplicationController
  
  def create
  	categories = Category.new(permit)
  		if categories.valid?
  			categories.save
  			render json: categories
  		else
  			render json: categories.errors
  		end
  end

  def update

  	exist = Category.exists?(params[:id].to_i)
  	if exist
  		objeto = Category.update(params[:id],permit)
  		render json: objeto
  	else
  		render json:  {"error"=> "La categoria no existe"}
  	end


  end
  
  private
  
  def permit
		params.permit(:title)
  end

end
