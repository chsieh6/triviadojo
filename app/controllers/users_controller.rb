class UsersController < ApplicationController
	before_action :signed_in_user, only: [:index, :show, :edit, :update, :destroy]
  before_action :correct_user,   only: [:edit, :update]
  before_action :admin_user,     only: :destroy

	def index
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
    if @user.save
      sign_in @user
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
	end

	def show
		@user = User.find(params[:id])
	end

	def edit
	end

	def update
	end

	def destroy
	end
	
	private

	  def user_params
	    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
	  end

	  def correct_user
	    @user = User.find(params[:id])
	    redirect_to(root_path) unless current_user?(@user)
	  end

	  def admin_user
	    redirect_to(root_path) unless current_user.admin?
	  end

end