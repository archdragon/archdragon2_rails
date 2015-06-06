class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  before_create :set_authentication_token

  def set_authentication_token
    return if authentication_token.present?
    self.authentication_token = generated_authentication_token
  end

  def generated_authentication_token
    SecureRandom.uuid.gsub(/\-/,'')
  end
end
