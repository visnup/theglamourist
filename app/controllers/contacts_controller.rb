class ContactsController < ApplicationController
  respond_to :html, :xml, :json

  # GET /contacts/1
  def show
    @contact = Contact.find(params[:id])
    respond_with @contact
  end

  # GET /contacts/new
  def new
    @contact = Contact.new :event_at => Date.today
    respond_with @contact
  end

  # POST /contacts
  def create
    @contact = Contact.create(params[:contact])
    respond_with @contact
  end
end
