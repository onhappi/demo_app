module SessionsHelper
 def sign_in(user)
   cookies.signed[:remember_token] = user.id
   @current_use = user
 end

 def current_user
  if @current_user.nil?
    User.find_by_id(cookies.signed[:remember_token])
  else
    @current_user
  end
 end

 def sign_out
  cookies.delete(:remember_token)
  @current_user = nil
 end
end