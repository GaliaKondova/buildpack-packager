module CacheDirectoryHelpers
  BUILDPACK_PACKAGER_CACHE_DIR = File.join(ENV['HOME'], '.buildpack-packager', 'cache')

  def uri_to_cache_filename(uri)
    uri.gsub(/[\/:]/, '_')
  end

  def uri_to_cache_path(uri)
    File.join(BUILDPACK_PACKAGER_CACHE_DIR, uri_to_cache_filename(uri))
  end

  def remove_from_cache_dir(uri)
    FileUtils.rm_f(uri_to_cache_path(uri))
  end

  def self.make_cache_copy(copy_location)
    if Dir.exist?(BUILDPACK_PACKAGER_CACHE_DIR)
      FileUtils.mv(BUILDPACK_PACKAGER_CACHE_DIR, copy_location)
    end
  end

  def self.restore_cache_copy(copy_location)
    if Dir.exist?(copy_location)
      FileUtils.mv(copy_location, BUILDPACK_PACKAGER_CACHE_DIR)
    end
  end

  def self.remove_current_cache
    puts BUILDPACK_PACKAGER_CACHE_DIR
    puts `ls -la /Users/pivotal/`
    FileUtils.rm_f(BUILDPACK_PACKAGER_CACHE_DIR)
    puts `ls -la /Users/pivotal/`
  end
end
