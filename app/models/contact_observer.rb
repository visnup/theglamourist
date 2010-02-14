class ContactObserver < ActiveRecord::Observer
  def after_create contact
    m = Mail.new do
      to 'jane@theglamourist.com'
      cc 'task+today@05316348.theglamourist.highrisehq.com'
      subject 'website lead'
    end
    m.from = contact.email
    m.body = contact.message
    m.deliver!
  end
end
