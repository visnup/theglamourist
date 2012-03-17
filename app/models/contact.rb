class Contact < ActiveRecord::Base
  validates_presence_of :name, :phone_number, :event_at
  validates :email, presence: true, email: true

  after_create :send_notifications

  def send_notifications
    Notifier.new_contact(self).deliver
  end
end
