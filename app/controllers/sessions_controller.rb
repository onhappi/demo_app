class SessionsController < ApplicationController
 def new
  @title = "Sign In"
 end
 
 def create
   user = User.authenticate(params[:session][:email],params[:session]   [:password])
   if user.nil?
     flash.now[:error]="Invalid email or password."
     @title = "Sign In"
     render "new"
   else
   sigm_in user
   redirect_to user
   # redirect to the user's show page
   end
 end

 def destory
 sign_out
 redirect_to root_path
 end

end
