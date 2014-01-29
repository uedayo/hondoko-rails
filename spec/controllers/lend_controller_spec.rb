require 'spec_helper'

describe LendController do
  describe 'scan ISBN-10 JP' do
    before do
      get :scan, isbn: 4048676881
    end

    it '200OK' do
      expect(response).to be_success
    end
  end

  describe 'scan ISBN-13 JP' do
    before do
      get :scan, isbn: 9784839919849
    end

    it '200OK' do
      expect(response).to be_success
    end
  end

  describe 'scan ISBN-13 US' do
    before do
      get :scan, isbn: 9780596006624
    end

    it '200OK' do
      expect(response).to be_success
    end
  end
end
