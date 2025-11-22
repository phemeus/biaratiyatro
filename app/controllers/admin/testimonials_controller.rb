module Admin
  class TestimonialsController < ApplicationController
    layout 'admin'
    before_action :authenticate_admin!

    def index
      @testimonials = Testimonial.all
    end

    def new
      @testimonial = Testimonial.new
    end

    def create
      @testimonial = Testimonial.new(testimonial_params)
      if @testimonial.save
        redirect_to admin_testimonials_path, notice: 'Yorum başarıyla eklendi.'
      else
        render :new
      end
    end

    def edit
      @testimonial = Testimonial.find(params[:id])
    end

    def update
      @testimonial = Testimonial.find(params[:id])
      @testimonial.assign_attributes(testimonial_params)
      if @testimonial.save
        redirect_to admin_testimonials_path, notice: 'Yorum başarıyla güncellendi.'
      else
        render :edit
      end
    end

    def destroy
      @testimonial = Testimonial.find(params[:id])
      @testimonial.destroy
      redirect_to admin_testimonials_path, notice: 'Yorum başarıyla silindi.'
    end

    private

    def testimonial_params
      params.require(:testimonial).permit(:name, :title, :comment)
    end
  end
end
