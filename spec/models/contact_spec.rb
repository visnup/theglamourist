require 'spec_helper'

describe Contact do
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:phone_number) }
    it { should validate_presence_of(:event_at) }

    describe 'email' do
      it { should validate_presence_of(:email) }
      it { should allow_value('bob@example.com').for(:email) }
      it { should_not allow_value('bob').for(:email) }
      it { should_not allow_value('@example.com').for(:email) }
    end
  end

  describe 'notifications' do
    subject { create :contact }

    specify do
      expect { subject }.to change{ ActionMailer::Base.deliveries.count }.by(1)
    end
  end
end
