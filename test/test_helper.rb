$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

if ENV['TRAVIS']
  begin
    require 'codeclimate-test-reporter'
    CodeClimate::TestReporter.start
  rescue LoadError
  end
end

require 'pry'
require 'active_support'
require 'active_prepender'
require 'test/unit'

Dir[File.join(File.dirname(__FILE__), 'fixtures/**/**.rb')].each {|f| require f }

