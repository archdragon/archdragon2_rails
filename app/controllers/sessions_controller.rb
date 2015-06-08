class SessionsController < ApplicationController
  def create
    user = User.last
    token_data = {
      api_key: {
        access_token: user.authentication_token,
        user_id: user.id
      }
    }
    render json: token_data
  end
end
