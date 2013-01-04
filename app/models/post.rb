class Post < ActiveRecord::Base

attr_accessible :content
belongs_to :user
has_many :comments
validates :content, presence: true, length: { maximum: 250 }
validates :user_id, :presence => true

   
  default_scope order: 'posts.created_at DESC'



end
