class ContactsController < ApplicationController
  # GET /contacts/new
  def new
    @contact = Contact.new event_at: Date.today
    respond_with @contact
  end

  # POST /contacts
  def create
    @contact = Contact.create(params.require(:contact).permit!)
    respond_with @contact
  end

  # GET /contacts/1
  def show
    raise SecurityError if params[:format] == 'json' && !admin?

    @contact = Contact.find(params[:id])
    respond_with @contact
  end
end
