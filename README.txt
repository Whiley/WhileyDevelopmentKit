Whiley Development Kit (WDK)
============================

The Whiley Development Kit provides a command-line interface for
compiling and running Whiley programs. See [whiley.org](http://whiley.org) for
more information on the language.

Install
--------------------

To install the Whiley Development Kit, first place the WDK containing this
readme into an appropriate directory. You then need to make sure that the `PATH`
environment variable points to the `bin/` directory inside where you placed the
WDK, where several scripts are provided for running Whiley. Then set the
`WHILEYHOME` environment variable to the directory of the WDK.

Run
--------------------

With the `PATH` setup correctly, you should be able to run the `wy` tool
to compile Whiley programs as follows:

    % cd examples
    % wy compile hello-world.whiley

At this point, you can run the program using the `wy` tool:

    % wy run hello-world
    Hello World

Command-Line Options
--------------------

To see the available command-line options, run `wy help`:

usage: wy [--verbose] command [<options>] [<args>]

Commands:
  help          Display help information
  compile       Compile one or more Whiley source files
  decompile     Decompile one or more binary WyIL files
  run           Execute a given method from a WyIL
  verify        Compile and verify one or more WyAL files
  jvmcompile    Compile Whiley source files to JVM class files
  javacompile   Compile Whiley source files to Java source files
  jvmrun        Execute a given classfile (requires main method)
  jscompile     Compile Whiley source files to JavaScript source files [EXPERIMENTAL]

Run `wy help COMMAND` for more information on a command

You can then find out more information about each command as
indicated.
