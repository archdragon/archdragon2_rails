class WelcomeController < ApplicationController
  before_action :token_authenticate, only: [:index2]

  def index
  end

  def index2
  end
end
