<!--
.. title:LEVEL 1: THE MINIMALLY FUNCTIONAL PROGRAM
.. slug: level-1
.. date: 2019-04-12 15:21:19 UTC-04:00
.. tags: 
.. category: 
.. link: 
.. description: 
.. type: text
-->


This is the most basic level of secure software engineering practice, appropriate for the small project not intended as a stand-alone software product, but as an incidental, one-off development in the course of a particular scientific investigation.  Such a piece of software is:

* Single use: neither meant to be distributed to others for their use, or kept and used for multiple projects

* Developed by one person, or at most two people working together in the same physical location

* Never connected to a network, but run as a regular user locally to a single system and without any elevated privileges

The goal of this software is usually to provide a particular function specific to one scientific investigation….however, scientific software is unique in that even our most transient one-off software products need to have a shelf life longer than their actual time in service.  In order to reproduce a scientific result, future scientists must be able to find, build, and run the software that processed the data or did other important functions as part of obtaining that result.

**For the smallest scientific software projects, the most important goal is for the software to be reproducible years later, at the desired version, without the intervention of its original authors.**

To this end, secure software engineering practice at the first level of our  maturity ladder  has six requirements:

1. Revision Control

2. Document Dependencies and Build Process

3. Build Infrastructure

4. Development Status

5. License

The rest of this chapter will lay out each of these requirements with how-tos and references on how to implement them for your own software projects.

### Revision Control

The rest of this chapter will lay out each of these requirements with how-tos and references on how to implement them for your own software projects.

#### Which revision control software should I use?

If you don’t know which revision control system is appropriate for your project, use [git](https://git-scm.com/).  Git is great at revision control for most types of projects, and at least decent for all the rest.  It is well-supported on all operating systems, it is free, and it is supported by countless hosted services such as [Github](https://github.com/), [Gitlab](https://about.gitlab.com/), or [Bitbucket](https://bitbucket.org/) (to avoid the overhead of running your own server), and easy to host with stand-alone [gitolite](https://gitolite.com/gitolite/index.html) or [Gitlab](https://about.gitlab.com/) if you must self-host due to the sensitivity of your research.

There are cases where Mercurial (hg) is an appropriate alternative to git.  However, do not start using CVS or Subversion today, especially for scientific software.  These older revision control systems completely lack modern integrity checking mechanisms.  So, if your science project’s primitives are archived somewhere for a few years and some corruption happens on the disk or tape, no one will ever know.  A modern system such as git or Mercurial guarantees that such accidental corruption would be noticed, and would not reflect poorly on the reproducibility of your research.

#### What else should I know about revision control?

Every revision control system provides unique identifiers for versions of your software.  Each time you tell the system about a change, we call this a commit.  In git, for example, the last few characters of a commit ID are normally used as the identifier.  If you look at the git log of a software project, it may summarize recent changes like this:



If you want to go a step further, you can create a tag to give one particular commit a name or number that is meaningful to humans.  The section on Semantic Versioning in chapter XX can show you the ideal way to do this.  However, as long as each tag is unique, it can give science reviewers confidence that they are using the correct version of your software.  For example, a lab notebook might read:

    “Processed data from file 234.09May2019.json using datascrub from tag ‘beta1’ in repo.”

Then, if this must ever be reproduced, you can go right back to that tag and get the correct version of the software.

An added benefit of revision control is that it encourages you to keep track of what you do when you change the software.  This can be of great help when you write your changelog (discussed later in this chapter).  Each time you make a commit, you’ll be prompted to provide a commit message briefly explaining what has changed in the software.  Taking the time to do this provides an invaluable record of the software’s evolution.

#### How can I learn more?

Git has an [excellent tutorial](https://git-scm.com/docs/gittutorial). The tutorial walks you through all the features of git and some details on each command, common situations you might find yourself in, and where to find more documentation.

### Document Dependencies and Build Process

Another key to ensuring reproducibility is to clearly document how to build your code so that you aren’t relying on memory or unspoken assumptions to get the job done. Anyone, yourself included, should be able to build and run your code with the correct results by reading the documentation and using the tools provided. This includes documenting what tools and development libraries that are used and their versions, providing default configuration where appropriate, and ensuring that when the software builds it is labeled in some way with the correct version number (if applicable).

For very small/simple projects, a `README.TXT` or `README.MD` file in the project’s root directory may be sufficient documentation if well-written.  For bigger, more complex projects, consider using automated documentation tools such as Github Pages or Read the Docs to make more extensive documentation easier to maintain.

Shipping a build tool that automates this process can greatly reduce not only what you have to document, but the work that you must do along the way while building, testing, and using the software.  You’ll find more on that later in this chapter under “Build Infrastructure”.

#### Documentation must-haves

* Where do I go to find the most current version of this software and its repository?

* Once I have the software, what do I need to build/run it?

	* What operating system(s) and architecture(s) will it run on?

	* What versions of the OS and dependencies was it tested or previously used with?

	* What steps should I take to build the software correctly?

* How do I operate the software, and how do I know when it is operating correctly?

* How is the software licensed?  How can I appropriately credit the author(s) of the software in my work?

	* More on software licensing under “License”, later in this chapter.

* What is the development status of this software?  Is it still maintained?

	* More on this under “Development Status”, later in this chapter.

#### Tips for readable default configuration files

If your software requires a configuration file in order to build or run, provide a default configuration to get others started, or as a reference in case someone must reproduce your work later.  If you normally provide many parameters to your program on the command line, consider moving that out to a configuration file instead.  Doing so makes it easier for you or others to understand in the future exactly how the program was run at a particular time, improving reproducibility.

Default config files should have a short description of each variable and a default value assigned to the variable. Commenting each variable in a config file to indicate what it does will also aid with reproducibility.  Remember, this only takes a moment and what seems obvious now will not be when someone tries to reproduce your research in 10 or more years.

### Build Infrastructure

“Build infrastructure” can refer to anything from a very simple [bash script](https://www.gnu.org/software/bash/) that builds your program to a more elaborate build system like [cmake](https://cmake.org/), [scons](https://scons.org/), or [waf](https://waf.io/).  The important thing is to automate as much of the build process as possible to reduce human error and ensure that your program builds the same way each time.  This makes debugging easier and more effective, and also helps to ensure that each time your program is used it was built as expected (reproducibility, reproducibility, reproducibility).

A good build infrastructure will output each step it does as it does them, as well as any errors or warnings it finds. Directing a copy of this to a file to review when the build fails will make finding the issue easier. Some build systems, such as [make](https://www.gnu.org/software/make/), will drop you into the file at the line it found the first error when you call it from the editor.

#### A Simple Build Script Example

~~~
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
~~~

### Development Status

Indicating the development status of your project is important to helping others understand what it is and what it is for.  This needn’t be complicated.  Just add a statement to your README and/or project web page indicating:

* How mature is this software?  Is it experimental, under development, in alpha/beta testing, or stable and production-ready?

	* Note that any software falling under level 1 of this guide should be considered “experimental”.

* How actively maintained is this software?  Does it have a solid multi-developer team with adequate resources, is it under best-effort maintenance only, or is it no longer actively maintained?

The purpose of stating development status is to (hopefully) prevent potential users of the software from making false assumptions about what the software should be used for, or how secure they can expect it to be.

### License

Not all researchers realize this, but if you release code on a public code-hosting site without stating its license, you still haven’t effectively shared it with anyone.  In the US and many other countries, all software defaults to “All Rights Reserved” unless explicitly licensed by its author(s).  Including a license statement with your software ensures that others can examine, use, or modify it, including to reproduce your research or to learn from or build upon your work.

There are many licenses out there, and we won’t try to explain them all or give a legal lecture in the confines of this document.  However, here are some useful starting points:

* The [two clause](https://opensource.org/licenses/BSD-2-Clause) or [three clause](https://opensource.org/licenses/BSD-3-Clause) BSD License, and the [MIT License](https://opensource.org/licenses/MIT) are open source licenses developed at academic institutions in order to keep software very shareable and open while also complying with various research grant requirements.  If you aren’t sure what to use, choose one of these.

* The Open Source Initiative maintains a [comprehensive list of open source licenses](https://opensource.org/licenses) in case you would like to learn about other open source license options.

* Generally, avoid any version of the GNU General Public License or its derivatives if your project is funded by a grant or cooperative agreement and you don’t have legal advice available regarding these issues.  The GPL has come into conflict with some research funding requirements, and it is out of scope of this document to try to understand or describe the cases where that may be true.

* While open science generally prefers open source licensing to ensure that the code needed to reproduce the scientific work can be freely used by anyone, there are situations where more restrictive licensing options may be required.  Usually this has to do with cases where your software depends on libraries or tools which are not themselves open source.  Check with your campus’ legal resources if you think this might be your situation.
