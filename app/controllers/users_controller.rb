class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to tasks_path(@user.id) #保存できたら、タスク一覧画面表示する。
    else
      render :new #もし、保存できなかったらnewページに遷移させる。
    end
  end

  def edit
    
  end
  

  def show
    @user = User.find(params[:id])
  end


  private

  def user_params
  params.require(:user).permit(:name, :email, :password, :password_confirmation)

  end
end
