class SessionsController < ApplicationController
  def new
  end

  def create
  	user = User.find_by(email: params[:session][:email].downcase)

    respond_to do |format| 
     if user && user.authenticate(params[:session][:password])
      if user.activated?  
        login user
        params[:session][:remember_me] == '1' ? remember(user) : forget(user)
        #format.html { redirect_back_or root_url }
        format.js
      else
        flash.now[:warning] = "Account not activated. Check your email for the valid activation link"
        #format.html { redirect_to root_url }
        format.js
      end
     else
     flash.now[:warning] = 'Invalid email/password combination'
     format.js
     end
    end
end

def destroy
 logout if logged_in?
 redirect_to root_url
end

end
