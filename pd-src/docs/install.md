---
title: MassMine Installation
abstract:
  MassMine is designed to run on Linux and Mac OSX. Pre-built, self-contained application bundles are available for both. Installation is as simple as downloading the latest zip or tarball and unpacking the files. Currently, versions are available for 64 bit operating systems.

  MassMine should run on most versions of Linux, FreeBSD, OpenBSD, and Mac OS X. Savvy users are encouraged to build MassMine from source (and share their experiences). Build instructions follow below.
...

## Step 1: Download Current Version: 1.0.2 (2016-09-07)

Download a copy of the latest version for your computer's architecture:
<ul class="install-list">
  <li><a href="http://www.massmine.org/downloads/massmine-1.0.2-linux-x86_64.zip"><i class="fa fa-download"></i>   MassMine for 64 bit Linux (zip)</a> | <b>MD5 checksum:</b> 64d17c79ff54c914db8a0a332ef185b9</li>
  <li><a href="http://www.massmine.org/downloads/massmine-1.0.2-OSX-10.10.5.zip"><i class="fa fa-download"></i>   MassMine for OS X (zip)</a> | <b>MD5 checksum:</b> cd1ddabe76eb50e2e0df7180ddff2d76</li>
</ul>

## Step 2: Install

Unpack the downloaded file, replacing all "x.x.x" with the version number you downloaded (for downloaded Mac OS X bundles, you can simply double click the zipped file to unpack it):

    unzip massmine-x.x.x-linux-x86_64.zip

The above command will produce a directory called "massmine". This is all you need to get working! Move this directory to somewhere in your file system for safe keeping.

Inside the directory "massmine" you will find an executable file called `massmine`. You can run this directly to get started right away. Working from inside the "massmine" directory:

    ./massmine --help

Even better, make the `massmine` command available from anywhere on your computer by creating a symbolic link to the executable somewhere on your path. Again, working from within the "massmine" directory, run:

    ln -s `pwd`/massmine /usr/local/bin

You may need administrator privileges for that last command, in which case try:

    sudo ln -s `pwd`/massmine /usr/local/bin

That's it! You're ready to use massmine. To get started, try running:

    massmine --help

<div class="hint">Once massmine is installed, work from within a different directory than the installed "massmine" folder. Leave these important files be!</div>

## Building From Source

Technically savvy users can build the massmine application from source. Does this sound mysterious? If so, try using the pre-packaged applications described in the installation instructions above. The remaining build instructions assumes knowledge of many common (and some uncommon) build tools.

## Use The Source

To build MassMine from source, you will need [Chicken Scheme](http://www.call-cc.org/) installed on your system.

Additionally, you will need the following [Eggs](http://wiki.call-cc.org/eggs) installed:

* clucker
* args
* openssl
* medea
* srfi-19
* pathname-expand
* html-parser

The openssl egg requires the openssl development libraries installed on your system. These can be installed with most package managers (e.g., apt-get, pacman, brew, etc.).

For example, on Ubuntu:

    sudo apt-get install libssl-dev

Assuming Chicken Scheme has been properly installed, these eggs (packages) can be installed in a single command:

    chicken-install clucker args openssl medea srfi-19 pathname-expand html-parser

Building MassMine is simple once Chicken is properly installed:

### Clone the git repository into a directory of your choice

    git clone https://github.com/n3mo/massmine.git

### Compile MassMine into a single executable

From within the root folder of the cloned repo run:

    csc massmine.scm

which will create a single executable called `massmine`. Put that executable on your path and you should be ready to go.
