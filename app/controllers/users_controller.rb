class UsersController < ApplicationController
  before_action :authorize, only: [:show, :edit]

  def index
    @users = User.all
  end

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path
    end
  end

  def edit
  end

  def update
  end

  def destroy
    User.find(params[:id]).destroy
    redirect_to '/'
  end

    #strong params: only these fields are allowed from forms
    private
    def user_params
      params.require(:user).permit(:name, :email, :password)
      #here params spits text_field
    end
end
