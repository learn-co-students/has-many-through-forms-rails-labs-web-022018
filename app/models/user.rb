class User < ActiveRecord::Base
  has_many :comments
  has_many :posts, through: :comments


    def comment_attributes=(comment_attributes)
      comment_attributes.values.each do |comment_attributes|
        comment = Comment.find_or_create_by(user_attribute)
        self.comments << comment
      end
    end
end
