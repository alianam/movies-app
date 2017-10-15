class UsersController < ApplicationController
  def show
    @user = User.find_by(id: params[:id])
    render 'show.html.erb'
  end

  def new
    render 'new.html.erb'
  end

  def create
    new_user = User.create(
      username: params[:username],
      first_name: params[:first_name],
      last_name: params[:last_name],
      zip_code: params[:zip_code]
    )
    redirect_to "users/#{new_user.id}"
  end

  def edit
    render 'edit.html.erb'
  end

  def update
    update_user = User.find_by(id: params[:id])
    redirect_to "/users/#{update_user.id}"
  end
end
