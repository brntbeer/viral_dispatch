class User < ActiveRecord::Base
  attr_accessible :login_type, :username
  has_many :comments
  has_many :posts

  def create_user_github(params)
    self.login_type = "github"
    self.username = params[:info][:nickname]
  end
end
