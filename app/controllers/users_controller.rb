class UsersController < ApplicationController

  before_action :find_user, only: [:show, :edit, :update, :destroy]
  before_action :is_logged_in, only: [:show, :edit, :update, :destroy]
  before_action :right_user, only: [:show, :edit, :update, :destroy]
  before_action :admin_user, only: :destroy

  def new
    if logged_in?
      redirect_to root_url
    else
      @user = User.new
    end
  end

  def create
  	@user = User.new(user_params)

    respond_to do |format|
  	if @user.save
      @user.send_activation_email
      flash[:info] = "Please check your email to activate your account"
      format.html{ redirect_to root_url}
      format.js
  	else 
  		format.html{ render 'new' }
      format.js
  	end
  end
  end

  def show
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
  end

  private

    def user_params
    	params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
    end

    def find_user
      @user = User.find(params[:id])
    end

    def is_logged_in
      if !logged_in?
        store_location
        flash[:danger] = "Please login!"
        redirect_to login_url
      end
    end

    def right_user
      @user = User.find(params[:id])
      if current_user.admin == false && !current_user?(@user)
        flash[:danger] = "Unauthorized requeset"
        redirect_to root_url
      end
    end

    def admin_user
      redirect_to root_url unless current_user.admin?
    end
end
