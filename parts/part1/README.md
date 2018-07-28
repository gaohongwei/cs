## Exercise 1##

### Pre-request ###
    Ruby 2.1.2 Installed
    Tested in Ruby 2.1.2
    Not tested in other Ruby version
### Installation ###
    # Cloning the repository
    $ git clone git://github.com/gaohongwei/album.git

    Or download the zip file from
    https://github.com/gaohongwei/album

### Usage ###
Syntax:
```ruby
$ ruby print_me.rb -h

Usage: print_me [Arguments]

Arguments:
    -f, --file file name             The input file name, required
    -p, --pivot pivot                The pivot point: average|median|none, default: median
    -s, --sort asc|desc              The sort order, default: asc
    -H, --header [on|off]            Print the header or not, default: off
    -h, --help                       help

Data file format:
...
...
```

Usage 1:
```ruby
$ ruby print_me.rb -f f1.txt
File 'f1.txt' does not exist
```

Usage 2:
```ruby
$ ruby print_me.rb -f data.txt
Process Stopped.
Data format errors:
line 2: XTC / Drums and Wires / 19790
line 17: Limelight - 2:270
```

Usage 3:
```ruby
$ ruby print_me.rb -f data.txt
1. Vampire Weekend - Contra - 2010 - Holiday - 2:18
2. Love - Forever Changes - 1967 - Bummer In The Summer - 2:24
$
```
