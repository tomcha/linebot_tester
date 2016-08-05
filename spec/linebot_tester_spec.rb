require 'spec_helper'

describe LinebotTester do
  it 'has a version number' do
    expect(LinebotTester::VERSION).not_to be nil
  end

  def app
    @app ||= LinebotTester::Application
  end

  describe "Application" do
    include Rack::Test::Methods
    describe 'レスポンスの精査' do
      describe '/ へのGetアクセス' do
        before { get '/'}
        it 'Getアクセスした時、正常なHTTPアクセスコードが返ること' do
          expect(last_response.status).to eq 200
        end
      end

      describe '/へのPostアクセス' do
        before { post '/linebot/callback'}
        it 'Postアクセスした時、正常なHTTPアクセスコードが返ること' do
          expect(last_response.status).to eq 200
        end
      end
    end
  end
  #  it 'does something useful' do
  #    expect(false).to eq(true)
  #  end
end
