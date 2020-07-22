class UsersController < ApplicationController
  
  before_action :set_user, only: [:show, :edit, :video_chat, :secret_word, :update, :destroy]
  before_action :logged_in_user, only: [:show, :index, :video_chat, :secret_word, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update]
  before_action :admin_user, only: [:secret_word, :destroy]
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "ユーザー情報を登録しました。"
      redirect_to @user
    else
      render :new
    end
  end
  
  def index
    @users = User.where(admin: false).paginate(page: params[:page])
  end

  
  def show
  end
  
  def video_chat
  end
  
  def secret_word
    @admin = User.find_by(admin: true)
    flash[:success] = "ユーザに合言葉を送りました。"
    NotificationMailer.secret_mail(@user, @admin).deliver if current_user.email.present?
    redirect_to video_chat_user_url
  end
  
  def edit
  end
  
  def update
    if @user.update_attributes(user_params)
      flash[:success] = "ユーザー情報を更新しました。"
      redirect_to @user
    else
      render :edit      
    end
  end
  
  def destroy
    @user.destroy
    flash[:success] = "#{@user.name}のデータを削除しました。"
    redirect_to users_url
  end
  
  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
    
    def set_user
      @user = User.find(params[:id])
    end
    
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "ログインしてください。"
        redirect_to login_url
      end
    end
    
    def correct_user
      @user = User.find(params[:id])
      unless current_user?(@user)
        flash[:danger] = "アクセス権限がありません。"
        redirect_to(root_url)
      end
    end
    
    def admin_user
      unless current_user.admin?
        flash[:danger] = "アクセス権限がありません"
        redirect_to(root_url)
      end
    end
end
