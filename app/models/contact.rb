class Contact < ActiveRecord::Base
  validates_presence_of :name, :phone_number, :event_at
  validates :email, :presence => true, :email => true
  after_create :send_notifications

  def send_notifications
    Notifier.contact(self).deliver
  end

  class Notifier < ActionMailer::Base
    default :to => 'jane@theglamourist.com', :subject => '[theglamourist] New Inquiry'

    def contact(contact)
      mail :from => "#{contact.name} <#{contact.email}>" do |format|
        format.text { render :text => contact.attributes.to_yaml }
      end
    end
  end
end
