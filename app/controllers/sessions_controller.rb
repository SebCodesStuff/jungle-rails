class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path
    else
      redirect_to login_url
      puts "incorrect login info"
    end
  end
  # 
  # def create
  #   if user = User.authenticate_with_credentials(params[:email], params[:password])
  #    user.save
  #    session[:user_id] = user.id
  #    redirect_to root_path
  #   else
  #     redirect_to new_user_path
  #   end
  # end

  def destroy
    session[:user_id] = nil
    redirect_to login_url
  end

end
