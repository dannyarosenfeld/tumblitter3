class TextPost < ActiveRecord::Base
    scope :recent, lambda { order('created_at DESC').limit(5) }

    belongs_to :user
    validates_presence_of :name
    
    has_many :likes, as: :likeable
    
end
