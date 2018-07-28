### Pre-request ###
    Ruby Installed
### Installation ###
    # Cloning the repository

    # bundle

### Usage ###
Syntax:
```ruby
$ ./run_me --h 
Usage: run_me [options]

Specific options:
        --top [number]; or --top[number]
                                     Top number, default: 25
        --state [name]; or --state_name
                                     State Name, default: all state

    -h, --help                       Show helper
```

Usages:
```ruby
$ ./run_me --state california --top 6
$ ./run_me --state CA --top 6
$ ./run_me --state ca --top 6

$ ./run_me --california --top6
$ ./run_me --CA --top 6
$ ./run_me --ca --top 6
```

Output:
```ruby
MAG TIME                PLACE
```

### Test Case ###
```ruby
rspec spec
Tested in Ruby 2.4.3
Not tested in other Ruby version
```
