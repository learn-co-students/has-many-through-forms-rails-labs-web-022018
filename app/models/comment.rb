class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post

  def user_attributes=(user_attributes)
  	if user_attributes['username'] != ''
	  	user_attributes.each do |user_attribute, value|
	  		user = User.find_or_create_by(user_attribute=>value)
	  		self.user = user
	  	end
	  end
  end

end
