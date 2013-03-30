require 'mami'
require 'thor'

module Mami
  class CLI < Thor
    desc "version", "Prints the mami's version information"
    def version
      puts "Mami version #{Mami::VERSION}"
    end
    map %w(-v --version) => :version
  end
end
