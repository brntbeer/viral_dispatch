class User < ActiveRecord::Base
  attr_accessible :login_type, :username
  has_many :comments
  has_many :posts

  validates :login_type, :presence => true
  validates :username, :uniqueness => true

  def self.find_by_username_for_twitter(params)
    where(login_type: "twitter", username: params[:info][:name]).first
  end
  
  def self.find_by_username_for_github(params)
    where(login_type: "github", username: params[:info][:nickname]).first
  end

  def create_user_github(params)
    self.login_type = "github"
    self.username = params[:info][:nickname]
  end

  def create_user_twitter(params)
    self.login_type = "twitter"
    self.username = params[:info][:name]
  end
end
