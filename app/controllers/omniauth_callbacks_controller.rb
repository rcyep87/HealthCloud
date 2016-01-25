class OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def fitbit
    @user = User.from_omniauth(request.env["omniauth.auth"])
    sign_in_and_redirect user_omniauth_authorize_path(@user)
  end

end
