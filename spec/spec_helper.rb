$LOAD_PATH << File.expand_path('../../lib', __FILE__)
$LOAD_PATH << File.expand_path('../../spec/helpers', __FILE__)
require 'buildpack/packager'
require 'file_system_helpers'
require 'cache_directory_helpers'
require 'fake_binary_hosting_helpers'

RSpec.configure do |config|
  config.include FileSystemHelpers
  config.include CacheDirectoryHelpers
  config.include FakeBinaryHostingHelpers

  cache_copy_location = File.join(ENV['HOME'], '.buildpack-packager', 'cache-copy')

  config.before(:suite) do
    CacheDirectoryHelpers.make_cache_copy(cache_copy_location)
  end

  config.after(:suite) do
    puts "I RAN"
    CacheDirectoryHelpers.remove_current_cache
    #CacheDirectoryHelpers.restore_cache_copy(cache_copy_location)
  end

  config.before(:all) do
    CacheDirectoryHelpers.remove_current_cache
  end
end
