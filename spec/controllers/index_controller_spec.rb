require 'spec_helper'

describe IndexController do
  around { |example| VCR.use_cassette('flickr', &example) }

  describe 'GET index' do
    before { get :index }

    it { should respond_with(:success) }
  end

  describe 'GET portfolio' do
    before { get :portfolio }

    it { should respond_with(:redirect) }
  end

  describe 'GET services' do
    before { get :services }

    it { should respond_with(:success) }
  end
end
