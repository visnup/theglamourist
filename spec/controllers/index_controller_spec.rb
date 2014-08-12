require 'spec_helper'

describe IndexController, type: :controller do
  around { |example| VCR.use_cassette('index', &example) }

  describe 'GET index' do
    before { get :index }
    it { should respond_with(:success) }
  end

  describe 'GET about' do
    before { get :about }
    it { should respond_with(:success) }
  end

  describe 'GET services' do
    before { get :services }
    it { should respond_with(:success) }
  end
end
