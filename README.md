# Mami

Show timestamped file name.

[![Build Status](https://api.travis-ci.org/sanemat/mami.png?branch=master)](https://travis-ci.org/sanemat/mami)

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
