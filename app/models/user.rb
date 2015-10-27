class User < ActiveRecord::Base
	has_and_belongs_to_many :users, 
	 :join_table => "follows",
    :foreign_key => "follower_id",
    :association_foreign_key => "followee_id"
	# has_and_belongs_to_many :users, :through => :follows, :source => :follower
end
