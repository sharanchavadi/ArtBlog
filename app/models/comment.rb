class Comment < ActiveRecord::Base

    belongs_to :article
    belongs_to :user
 

	validates_presence_of :title, :body, :article_id
	validates_numericality_of :article_id, greater_than: 0
	validates_length_of :body, minimum: 10, allow_blank: true

end
