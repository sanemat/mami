require 'mami'
require 'thor'

module Mami
  class CLI < Thor
    desc 'echo mami', 'echo mami name'
    def name
      puts 'Tomoe Mami'
    end
  end
end
