require 'rails_helper'
require 'spec_helper'

RSpec.describe ApiController, type: :controller do
  let(:json){
    JSON.parse(response.body)
  }
  describe 'POST /submission/submit' do
    it 'expect api to return correct results with correct status' do
      post :submit, :params => {:code => "print 1"}
      expect(json['status']).to eql("success")
      expect(json['output']).to eql("1")
    end
    it 'expect api to return TLE' do
      post :submit, :params => {:code=>"loop do \n puts 5 \n sleep 300 \n end"}
      expect(json['status']).to eql("Time Limit Exceeded")
      expect(json['output']).to eql("")
    end
    it 'expect api to return undefined' do
      post :submit, :params => {:code=>"lo 5"}
      expect(json['status']).to eql("No Method Error")
      expect(json['output']).to eql("")
    end
    it 'expect api to flag division by zero' do
      post :submit, :params => {:code=>"puts 1/0"}
      expect(json['status']).to eql("Zero Division Error")
    end
  end
end
