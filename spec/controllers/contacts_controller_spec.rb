require 'spec_helper'

describe ContactsController, type: :controller do
  let(:contact) { create :contact }
  subject { controller }

  describe 'GET new' do
    before { get :new }

    it { should respond_with(:success) }
  end

  describe 'POST create' do
    let(:contact_attributes) { attributes_for(:contact) }
    before { post :create, contact: contact_attributes }

    it { should redirect_to(assigns[:contact]) }

    it 'should create the contact' do
      expect(Contact.last.name).to eq(contact_attributes[:name])
    end
  end

  describe 'GET show' do
    before { get :show, id: contact.to_param }

    it { should respond_with(:success) }
    it { should render_template(:show) }

    describe 'json' do
      subject { get :show, id: contact.to_param, format: 'json' }

      specify do
        expect { subject }.to raise_error(SecurityError)
      end

      context 'as admin' do
        before { session[:admin] = true }

        it { should be_successful }
      end
    end
  end
end
