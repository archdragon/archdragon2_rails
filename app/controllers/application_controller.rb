class ApplicationController < ActionController::Base
  protect_from_forgery

  protected

  def token_authenticate
    authenticate_or_request_with_http_token do |token, options|
      User.find_by(authentication_token: token)
    end
  end
end
