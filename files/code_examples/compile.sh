#!/usr/bin/env bash

# This is an example script for the swe guide on software development.
# It is to show how to use a Bash script to compile a piece of software.

# We will set variables for the script and file so that they can be changed
# in one location and we don't have to worry about changing them in every
# location the variable is used.

$script = process.py # This is the python program starting point
$file  = data.txt    # Our data set

# Run the process.py script using python3 and use the data.txt as a command
# line argument for the process.py script.

python3 $script $file

# exit the shell script

exit
