# Mami

[![Gem Version](https://badge.fury.io/rb/mami.png)](http://badge.fury.io/rb/mami)
[![Build Status](https://api.travis-ci.org/sanemat/mami.png?branch=master)](https://travis-ci.org/sanemat/mami)
[![Code Climate](https://codeclimate.com/github/sanemat/mami.png)](https://codeclimate.com/github/sanemat/mami)
[![Coverage Status](https://coveralls.io/repos/sanemat/mami/badge.png?branch=master)](https://coveralls.io/r/sanemat/mami)
[![Dependency Status](https://gemnasium.com/sanemat/mami.png)](https://gemnasium.com/sanemat/mami)

Show timestamped file name.

## Installation

Install it yourself as:

    $ gem install mami

## Usage

    Usage:
     $ mami #=> /path/to/mami/2013-04-09-21-46-43.txt

    Use cases:
     (On vim command mode)
     :w `mami`
     #=> save text to /path/to/mami/2013-04-09-22-06-12.txt

     $ some_command > `mami --extension log -d .`
     #=> Write stdout to ./2013-04-09-22-07-08.log

    Commands:
     mami help [TASK]  # Describe available tasks or one specific task
     mami print        # Prints timestamped text file path
     mami version      # Prints the mami's version information

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
