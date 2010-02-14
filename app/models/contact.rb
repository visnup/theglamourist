class Contact < ActiveRecord::Base
  validates_presence_of :name, :message
  validates :email, :presence => true, :email => true
end
