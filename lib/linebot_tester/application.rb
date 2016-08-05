require 'sinatra/base'

module LinebotTester
  class Application < Sinatra::Base
    get '/' do
      'hello, linebot tester!'
    end

    post '/linebot/callback' do
      'post method is done'
    end
  end
end
