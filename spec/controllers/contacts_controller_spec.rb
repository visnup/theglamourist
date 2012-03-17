require 'spec_helper'

describe ContactsController do
  let(:contact) { create :contact }

  describe 'GET new' do
    before { get :new }

    it { should respond_with(:success) }
    it { should assign_to(:contact) }
  end

  describe 'POST create' do
    before { post :create, contact: attributes_for(:contact) }

    it { should redirect_to(assigns[:contact]) }
  end

  describe 'GET show' do
    before { get :show, id: contact.to_param }

    it { should respond_with(:success) }
    it { should assign_to(:contact).with(contact) }
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
