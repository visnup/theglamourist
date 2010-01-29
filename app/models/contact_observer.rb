class ContactObserver < ActiveRecord::Observer
  def after_create contact
    person = Highrise::Person.find :first, :from => :search,
      :params => { :criteria => { :email => contact.email } }
    unless person
      person = Highrise::Person.create :name => contact.name,
        :contact_data => {
          :email_addresses => [
            { :address => contact.email,
              :location => 'Work' }
          ]
        }
    end

    email = Highrise::Email.new :body => contact.message,
      :title => 'website lead'
    email.prefix_options = { :person_id => person.id }
    email.save
  end
end