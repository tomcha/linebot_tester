$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'linebot_tester'
require 'linebot_tester/version'
require 'rack/test'

RSpec.configure do |conf|
    conf.include Rack::Test::Methods
end
