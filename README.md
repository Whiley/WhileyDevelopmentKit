# Whiley Development Kit

Repository of releases for the Whiley Programming Language.  See
[whiley.org](http://whiley.org) for more information on the language.
The Whiley Development Kit provides a command-line interface for
compiling and running Whiley programs.

## Install

To install the Whiley Development Kit, first download the latest
version from the `dist/` directory and unpack the tarball into an
appropriate directory. You then need to make sure that `PATH`
environment variable points to the `bin/` directory inside where you
unpacked the tarball, where several scripts are provided for running
Whiley. Then set the `WHILEYHOME` environment variable to the
directory of the unpacked tarball.

## Run

With the `PATH` setup correctly, you should be able to run the `wy` tool
to compile Whiley programs as follows:

```
% cd example
% wy build
```

At this point, you should be able to see the generated JavaScript files in `bin/js`.  You can run the program by pointing your web-browser to the `index.html` file provided.

## Command-Line Options

To see the available command-line options, run `wy help`:

```
usage: wy [--verbose] command [<options>] [<args>]

Commands:
  check     Perform randomised testing of functions and methods
  build     Perform build operations on an existing project
  clean     Remove all target (i.e. binary) files
  config    Get or set configuration options
  help      Display help information
  install   Install package into local repository
  inspect   Inspect a given project file
  run       Execute method in package
  
Run `wy help COMMAND` for more information on a command
```

You can then find out more information about each command as
indicated.
