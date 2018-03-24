class Post < ActiveRecord::Base
  has_many :post_categories
  has_many :categories, through: :post_categories
  has_many :comments
  has_many :users, through: :comments
  accepts_nested_attributes_for :categories, :comments, reject_if: :all_blank

  def user_post
    self.users.map {|user| user}.uniq
  end
end
