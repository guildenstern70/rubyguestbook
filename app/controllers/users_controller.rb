class UsersController < ApplicationController

  def login

    if params[:user]
      @user = User.authenticate(params[:user])
      if @user
        redirect_to controller: 'entry', action: 'list'
      else
        @errors = true
        @user = User.new
        render :login
      end
    else
      @user = User.new
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
