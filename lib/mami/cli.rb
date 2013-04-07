require 'mami'
require 'thor'

module Mami
  class CLI < Thor
    check_unknown_options!
    default_task :print

    desc "version", "Prints the mami's version information"
    def version
      puts "Mami version #{Mami::VERSION}"
    end
    map %w(-v --version) => :version

    desc "print", "Prints timestamped text file path"
    method_option :extension, default: 'txt', aliases: '--ext', desc: 'Set extension, if nil, then no extension'
    method_option :directory, default: nil, aliases: '-d', desc: 'Set directory. if nil, then use MAMI_DIR'
    def print(opt = {})
      time = opt[:time] || Time.now
      path = options[:directory] || ENV['MAMI_DIR']
      abort("mami requires MAMI_DIR or directory option") unless path
      basename = time.strftime('%Y-%m-%d-%H-%M-%S')
      extension = options[:extension].nil? ? nil : '.' + options[:extension]
      filename = [basename, extension].compact.join
      puts File.join(path, filename)
    end
  end
end
