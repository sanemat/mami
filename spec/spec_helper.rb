$:.unshift File.expand_path('..', __FILE__)
$:.unshift File.expand_path('../../lib', __FILE__)
require 'rubygems'
require 'bundler/setup'
require 'mami'

# Require the correct version of popen for the current platform
if RbConfig::CONFIG['host_os'] =~ /mingw|mswin/
  begin
    require 'win32/open3'
  rescue LoadError
    abort "Run `gem install win32-open3` to be able to run specs"
  end
else
  require 'open3'
end

Dir["#{File.expand_path('../support', __FILE__)}/*.rb"].each do |file|
  require file unless file =~ /fakeweb\/.*\.rb/
end

$debug    = false
$show_err = true

RSpec.configure do |config|
  config.include Spec::Path
  config.include Spec::Helpers

  original_wd       = Dir.pwd

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.before :each do
    reset!
    in_app_root
  end

  config.after :each do
    puts @out if example.exception

    Dir.chdir(original_wd)
    # Reset ENV
  end
end
