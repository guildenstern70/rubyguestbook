class UsersController < ApplicationController

  def login

    @user = User.authenticate(params[:username], params[:password])
    if @user
      render :show
    else
      @errors = true
      render :index
    end

  end

  def index
  end

  def show

    @user = User.find(id=params[:id])

  end

  def new

    @user = User.new

  end

  def create

    user_data = params.require(:user).permit(:username, :password, :password_confirmation)
    @user = User.new(user_data)
    if @user.valid?
      @user.save()
      redirect_to action: 'show', id: @user.id
    else
      render :new
    end

  end

  def list
  end
end
