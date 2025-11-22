module Admin
  class StaffsController < ApplicationController
  layout 'admin'
  before_action :authenticate_admin!

    def index
      @staffs = Staff.all
    end

    def new
      @staff = Staff.new
    end

    def create
      @staff = Staff.new(staff_params)
      if @staff.save
        redirect_to admin_staffs_path, notice: 'Staff member was successfully created.'
      else
        render :new
      end
    end

    def edit
      @staff = Staff.find(params[:id])
    end

    def update
      @staff = Staff.find(params[:id])
      @staff.assign_attributes(staff_params)
      if @staff.save
        redirect_to admin_staffs_path, notice: 'Staff member was successfully updated.'
      else
        render :edit
      end
    end

    def destroy
      @staff = Staff.find(params[:id])
      @staff.destroy
      redirect_to admin_staffs_path, notice: 'Staff member was successfully deleted.'
    end

    private

    def staff_params
      params.require(:staff).permit(:name, :role, :bio, :photo_url)
    end
  end
end
