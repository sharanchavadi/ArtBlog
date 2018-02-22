class Article < ActiveRecord::Base

	belongs_to :category
	has_many :comments
	belongs_to :user 

    validates_presence_of :title, :body, :category_id, :publish_date
    validates_numericality_of :category_id, greater_than: 0
    validates_length_of :body, minimum: 10
    validates_length_of :title, minimum:3
    
	validate :check_based_on_date

	def check_based_on_date
		if !self.publish_date.nil?
			if self.publish_date < Date.today
				self.errors.add(:publish_date, "Article should not be less than today date")
            end
        end
    end
	
end
