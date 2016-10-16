$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

if ENV['TRAVIS']
  begin
    require 'codeclimate-test-reporter'
    CodeClimate::TestReporter.start
  rescue LoadError
  end
end

require 'pry'
require 'test/unit'
