require 'spec_helper'

describe Category do
  describe 'slug' do
    describe '#to_param' do
      subject { Category.create(name: 'Hello There').to_param }
      it { should eq('hello-there') }
    end

    describe '.from_param' do
      subject { Category.from_param 'beauty' }

      let(:category) { Category.create name: 'Beauty' }

      it { should eq(category) }
    end
  end
end
