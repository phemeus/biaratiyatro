class SubscribersController < ApplicationController
  def create
    @subscriber = Subscriber.new(subscriber_params)
    
    if @subscriber.save
      redirect_back fallback_location: root_path, notice: 'Bültenimize başarıyla abone oldunuz!'
    else
      redirect_back fallback_location: root_path, alert: 'Abone olurken bir hata oluştu. Lütfen tekrar deneyin.'
    end
  end

  private

  def subscriber_params
    params.require(:subscriber).permit(:email)
  end
end
