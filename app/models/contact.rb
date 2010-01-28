class Contact < ActiveRecord::Base
  validates_presence_of :name, :message
  validates_email_format_of :email
end
