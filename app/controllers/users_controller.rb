class UsersController < ApplicationController
  def show
    @user = User.find_by(id: params[:id])
    render 'show.html.erb'
  end

  def new
    render 'new.html.erb'
  end

  def create
    new_user = User.new(
      username: params[:username],
      first_name: params[:first_name],
      last_name: params[:last_name],
      zip_code: params[:zip_code]
    )
    new_user.save
    if user.save
      session[:user_id] = user.id
      # flash[:success] = 'Successfully created account!'
      redirect_to "/watched_movies"
    else
      # need to add the ability to flash a warning
      # flash[:warning] = 'Invalid email or password!'
      redirect_to '/users/new'
    end
  end

  def edit
    @user = User.find_by(id: params[:id])
    render 'edit.html.erb'
  end

  def update
    update_user = User.find_by(id: params[:id])
    update_user.update(
      username: params[:username],
      first_name: params[:first_name],
      last_name: params[:last_name],
      zip_code: params[:zip_code]
    )
    redirect_to "/users/#{update_user.id}"
  end
end
