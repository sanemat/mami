require 'mami'
require 'thor'

module Mami
  class CLI < Thor
    default_task :print

    desc "version", "Prints the mami's version information"
    def version
      puts "Mami version #{Mami::VERSION}"
    end
    map %w(-v --version) => :version

    desc "print", "Prints timestamped text file path"
    method_option :extension, default: 'txt', aliases: '--ext', desc: 'Set extension, if nil, then no extension'
    method_option :directory, default: nil, aliases: '-d', desc: 'Set directory. if nil, then use MAMI_DIR'
    def print
      path = options[:directory] || ENV['MAMI_DIR']
      return puts "no-mami" unless path
      fullpath = File.expand_path(path)
      basename = %x[date "+%Y-%m-%d-%H-%M-%S"].chomp
      extension = options[:extension].nil? ? nil : '.' + options[:extension]
      filename = [basename, extension].compact.join
      puts File.join(fullpath, filename)
    end
  end
end
