require 'sinatra/base'

module LinebotTester
  class Application < Sinatra::Base
    get '/' do
      'hello, linebot tester!'
    end
  end
end
