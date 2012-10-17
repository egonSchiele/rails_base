class UsersController < ApplicationController
  before_filter :logged_in, :except => [:new, :create]
  def new
  end

  def home
  end

  def create
    @user = User.new(:name => params[:name], :email => params[:email], :password => params[:password], :password_confirmation => params[:password_confirmation])
    if @user.save
      flash[:success] = "You have signed up!"
      redirect_to "/"
    else
      flash[:error] = @user.errors.full_messages.join("\n")
      render :new
    end
  end
end
