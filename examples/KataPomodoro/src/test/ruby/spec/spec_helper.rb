begin
  require 'spec'
rescue LoadError
  require 'rubygems'
  gem 'rspec'
  require 'spec'
end

require 'java'

TARGET = File.expand_path('../../../../target', File.dirname(__FILE__))
$CLASSPATH << TARGET
#JRuby.runtime.jruby_class_loader.addURL(java.io.File.new(TARGET).to_url)

#require 'mocha'

Spec::Runner.configure do |config|
#  config.mock_with :mocha
end
