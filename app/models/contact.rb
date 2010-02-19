class Contact < ActiveRecord::Base
  validates_presence_of :name, :message
  validates :email, :presence => true, :email => true
  after_create :send_notifications

  def send_notifications
    Notifier.contact(self).deliver

    person = Highrise::Person.find :first, :from => :search,
      :params => { :criteria => { :email => email } }
    unless person
      person = Highrise::Person.create :name => name,
        :contact_data => {
          :email_addresses => [
            { :address => email,
              :location => 'Work' }
          ]
        }
    end

    email = Highrise::Email.new :body => message,
      :title => 'website lead'
    email.prefix_options = { :person_id => person.id }
    email.save
  end

  class Notifier < ActionMailer::Base
    default :to => 'jane@theglamourist.com', :subject => 'website lead'

    def contact(contact)
      mail :from => "#{contact.name} <#{contact.email}>" do |format|
        format.text { render :text => contact.message }
      end
    end
  end
end
