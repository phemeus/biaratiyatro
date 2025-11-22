class StaffsController < ApplicationController
  def index
    @staffs = Staff.all
  end
end
