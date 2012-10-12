class Post < ActiveRecord::Base
  attr_accessible :body, :title, :user_id
  has_many :comments, :dependent => :destroy
  belongs_to :user

  validates :user_id, :uniqueness => true
end
