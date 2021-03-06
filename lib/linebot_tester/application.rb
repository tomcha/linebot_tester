require 'sinatra/base'
require 'json'
require 'date'

module LinebotTester
  class Application < Sinatra::Base
    get '/' do
      'hello, linebot tester!'
    end

    post '/' do
    end

    post '/linebot/callback' do
      request.body.rewind  # 既に読まれているときのため
      data = request.body.read
      json_data = JSON.parse data
            path = File.expand_path('../../../log/', __FILE__)
            File.open(File.join(path,'params.log'), "a") do |f|
              f.puts "\n#{DateTime.now.strftime('%Y-%m-%d %H:%M:%S')} #{data}"
              json_data.each do |key, value|
                txt = "key: #{key}, value: #{value}"
                f.puts txt
              end
            end
            'params logged.'
    end
  end
end
