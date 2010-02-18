class Contact < ActiveRecord::Base
  validates_presence_of :name, :message
  validates :email, :presence => true, :email => true
  after_create :send_notifications

  def send_notifications
    m = Mail.new do
      to 'jane@theglamourist.com'
      subject 'website lead'
    end
    m.from = email
    m.body = message
    m.deliver!

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
end
