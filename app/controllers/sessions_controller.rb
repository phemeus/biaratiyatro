class SessionsController < ApplicationController
  layout 'application'

  def new
    if logged_in?
      redirect_to admin_root_path
    end
  end

  def create
    user = AdminUser.find_by_username(params[:username])
    
    if user && user.authenticate(params[:password])
      session[:admin_user_id] = user.id
      redirect_to admin_root_path, notice: "Başarıyla giriş yapıldı."
    else
      flash.now[:alert] = "Geçersiz kullanıcı adı veya şifre."
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    session[:admin_user_id] = nil
    redirect_to login_path, notice: "Çıkış yapıldı."
  end
end
