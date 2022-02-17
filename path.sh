#!/bin/bash

# I'm not sure if a bash script can detect the type of shell that invoked it.  it's def complicated.
# it might make more sense to just have multiple versions of this script for the various shells.

## security checks:

# permissions of this file

# permissions of .path and .path_prev

# permissions of whatever this shell's startup files are ... how to determine that?
# https://kb.iu.edu/d/abdy is a start ...

## detect added path elements in current dir ...

## detect changes since last login ...

# echo path in the correct format for the current shell
NEWPATH=`cat ~/.path | tr '\n' ':'`
echo $PATH
