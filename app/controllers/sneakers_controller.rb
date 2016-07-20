class SneakersController < ApplicationController

	before_action :find_sneaker, only: [:show, :edit, :update, :destroy]

	def index
		@user = User.new
		if params[:category].blank?
		    @sneakers = Sneaker.all.order("created_at DESC")
		else
			@category_id = Category.find_by(name: params[:category]).id
			@sneakers = Sneaker.where(:category_id => @category_id).order("created_at DESC")
	    end
	end

	def new
		@sneaker = Sneaker.new
		@categories = Category.all.map{ |c| [c.name, c.id]}
	end

	def create
		@sneaker = current_user.sneakers.build(sneaker_params)
		@sneaker.category_id = params[:category_id]
		if @sneaker.save
			redirect_to root_path
		else
			render 'new'
		end
	end

	def show
		@user = User.new
	end

	def edit
		@categories = Category.all.map{ |c| [c.name, c.id]}
	end

	def update
		@sneaker.category_id = params[:category_id]
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
	  	params.require(:sneaker).permit(:title, :detail, :price, :category_id, :sneaker_img)
	  end

	  def find_sneaker
	  	@sneaker = Sneaker.find(params[:id])
	  end
end
