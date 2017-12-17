class Notifier < ActionMailer::Base
  default to:      'jane@theglamourist.com',
          subject: '[theglamourist] New Inquiry'

  def new_contact(contact)
    @contact = contact
    mail from:    "#{@contact.name} <inquiry@theglamourist.com>",
         subject: "[theglamourist] #{@contact.event_at.to_date.to_s(:long)}"
  end
end
