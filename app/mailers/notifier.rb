class Notifier < ActionMailer::Base
  default :to => 'jane@theglamourist.com',
          :subject => '[theglamourist] New Inquiry'

  def new_contact(contact)
    @contact = contact
    mail :from => "#{@contact.name} <#{@contact.email}>"
  end
end
