class SessionsController < ApplicationController
  layout 'application'

  def new
    if logged_in?
      redirect_to admin_root_path
    end
  end

  def create
    auth_response = FirebaseAuthService.sign_in(params[:email], params[:password])
    
    if auth_response
      session[:admin_user_id] = auth_response['localId']
      session[:admin_email] = auth_response['email']
      redirect_to admin_root_path, notice: "Başarıyla giriş yapıldı."
    else
      flash.now[:alert] = "Geçersiz e-posta veya şifre."
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    session[:admin_user_id] = nil
    redirect_to login_path, notice: "Çıkış yapıldı."
  end
end
