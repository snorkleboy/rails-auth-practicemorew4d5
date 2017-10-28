class SessionsController < ApplicationController
#log in form
  def new
    render :new
  end
#log in
  def create
    user=User.find_by_credentials(params[:user][:e_mail],params[:user][:password])
    if ( user)
      log_in_user!(user)
      redirect_to user_url(id: user.id)
    else
      flash[:errors]=["email/password is wrong"]
      render :new
    end
  end
# log out
  def destroy
    current_user.reset_session_token!
    session[:session_token]=nil
    redirect_to new_sessions_url
  end

  private
  def user_params
    params.require(:user).permit(:e_mail, :password)
  end
end
