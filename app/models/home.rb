class Home < ActiveRecord::Base
  validates_presence_of :content
  belongs_to :shop  
end
