class Comment < ActiveRecord::Base

attr_accessible :contents

belongs_to :post
belongs_to :user

validates :contents, :presence => true, :length => { :maximum => 100 }
validates :user_id, :presence => true
validates :post_id, :presence => true

   default_scope order: 'comments.created_at DESC'

end
