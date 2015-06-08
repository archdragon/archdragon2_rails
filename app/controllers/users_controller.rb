class UsersController < ApplicationController
  def show
    render json: { 
      users: [{
        id: 2,
        user_id: 2,
        name: 'Test',
        email: 'test@test.com',
        username: 'TestName',
        apiKeys: [],
        api_keys: []
      }]
    }
  end
end
