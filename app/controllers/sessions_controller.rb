class SessionsController < ApplicationController

  def new
  end
  
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    #binding.irb
    if user&.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to tasks_path
    else
      flash.now[:danger] = 'ログインに失敗しました'
      render :new
    end
  end


  def destroy
      session.delete(:user_id)
      redirect_to new_session_path
      flash[:danger] = "ログアウトしました"
      end
  

end
