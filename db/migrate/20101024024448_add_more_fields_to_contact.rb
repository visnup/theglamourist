class AddMoreFieldsToContact < ActiveRecord::Migration
  def self.up
    add_column :contacts, :phone_number, :string
    add_column :contacts, :service_type, :string
    add_column :contacts, :event_venue, :string
    add_column :contacts, :event_at, :date
    add_column :contacts, :party_size, :string
    add_column :contacts, :ready_time, :time
  end

  def self.down
    remove_column :contacts, :ready_time
    remove_column :contacts, :party_size
    remove_column :contacts, :event_at
    remove_column :contacts, :event_venue
    remove_column :contacts, :service_type
    remove_column :contacts, :phone_number
  end
end
