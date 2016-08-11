require 'spec_helper'

describe LinebotTester do
  it 'has a version number' do
    expect(LinebotTester::VERSION).not_to be nil
  end

  def app
    @app ||= LinebotTester::Application
  end

  describe "Application" do
#    include Rack::Test::Methods
    describe 'レスポンスの精査' do
      describe '/ へのGetアクセス' do

        before { get '/'}
        it '正常なHTTPアクセスコードが返ること' do
          expect(last_response.status).to eq 200
        end

      end

      describe '/へのPostアクセス' do

        before { post '/'}
        it '正常なHTTPアクセスコードが返ること' do
          expect(last_response.status).to eq 200
        end

      end

      describe '/line/callbackへパラメーター付きのPostアクセス' do

        before { post '/linebot/callback', '{"a":1, "b":"弐"}', { "CONTENT_TYPE" => "application/json" } }
        it '正常なHTTPアクセスコードが返ること' do
          expect(last_response.status).to eq 200
        end

        it 'パラメータ値がbodyに反映されて返ること' do
          expect(last_response.body).to eq('params logged.') 
        end
      end
    end
  end
  #  it 'does something useful' do
  #    expect(false).to eq(true)
  #  end
end
