class SneakersController < ApplicationController

	before_action :find_sneaker, only: [:show, :edit, :update, :destroy]

	def index
		@sneakers = Sneaker.all
	end

	def new
		@sneaker = Sneaker.new
	end

	def create
		@sneaker = Sneaker.new(sneaker_params)
		if @sneaker.save
			redirect_to root_path
		else
			render 'new'
		end
	end

	def show
	end

	def edit
	end

	def update
		if @sneaker.update(sneaker_params)
			redirect_to sneaker_path(@sneaker)
		else
			render 'edit'
		end
	end

	def destroy
		@sneaker.destroy
		redirect_to root_path
	end

	private

	  def sneaker_params
	  	params.require(:sneaker).permit(:title, :detail, :price)
	  end

	  def find_sneaker
	  	@sneaker = Sneaker.find(params[:id])
	  end
end
