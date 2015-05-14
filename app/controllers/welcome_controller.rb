class WelcomeController < ApplicationController
  def index
    @dragon = Dragon.new(user: User.new)
    @dragon = present(@dragon)
  end
end
