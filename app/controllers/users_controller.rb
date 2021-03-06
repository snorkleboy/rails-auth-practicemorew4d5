class UsersController < ApplicationController

  def new
    render :new
  end

  def create
    user = User.new(user_params)
    if (user.save)
      log_in_user!(user)

      redirect_to user_url(user)
    else
        flash.now[:errors]=user.errors.full_messages
      render :new
    end
  end

  def update
  end

  private

  def user_params
    params.require(:user).permit(:e_mail, :password)
  end
end
