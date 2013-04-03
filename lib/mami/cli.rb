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
    def print
      path = ENV['MAMI_DIR']
      return puts "no-mami" unless path
      extension = options[:extension].nil? ? nil : '.' + options[:extension]
      puts [path, "/", %x[date "+%Y-%m-%d-%H-%M-%S"].chomp, extension].compact.join
    end
  end
end
