class RegistrationsController < ApplicationController
  def index
    @registrations = Registration.all
  end

  def show
    @registration = Registration.find(params[:id])
  end
end