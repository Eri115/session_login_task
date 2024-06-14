class UsersController < ApplicationController
  before_action :correct_user, only: [:show,:update,:destroy,:edit]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to tasks_path 
      flash[:notice] = 'アカウント登録しました'
       #保存できたら、タスク一覧画面表示する。
    else
      render :new #もし、保存できなかったらnewページに遷移させる。
    end
  end

  def edit
    #@user = User.find(params[:id])
  end



  def show
    @user = User.find(params[:id])
  end

  #ユーザーを見つける
  #ユーザーを見つけたら、アップデートする
  #もし見つからなかったら、編集ページにリダイレクトする。
  def update
    #binding.irb
    @user = User.find(params[:id])

    if @user.update(user_params)
      redirect_to user_path, notice: t('.updata')
    else
      render :edit
    end
    # @user = user (params[:id])
     
    #if @user.upadata(params[:id])
  end

  def destroy
    #binding.irb
    @user.destroy
    redirect_to new_session_path
  end



  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def correct_user
    #binding.irb
    @user = User.find(params[:id])
    redirect_to current_user unless current_user?(@user)
  end
end
