class User < ActiveRecord::Base
  has_many :comments
  has_many :posts, through: :comments

  def user_attributes=(user_params)
    User.find_or_create_by(user_params)
  end

end
