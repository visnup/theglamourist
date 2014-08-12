require 'spec_helper'

describe PostsController, type: :controller do
  describe 'GET index' do
    before { get :index }

    it { should respond_with(:success) }

    describe 'XML' do
      before { get :index, format: 'xml' }

      it { should respond_with(:success) }
    end
  end
end
