class UsersController < ApplicationController
  def create
    user = User.new(params[:user])

    if user.save
      render json: user, status: :created
    else
      respond_with user
    end
  end
end

