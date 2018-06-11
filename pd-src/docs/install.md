---
title: MassMine Installation
abstract:
  MassMine is designed to run on Linux and Mac OSX. Pre-built, self-contained application bundles are available for both. Installation is as simple as downloading the latest zip or tarball and unpacking the files. Currently, versions are available for 64 bit operating systems.

  MassMine should run on most versions of Linux, FreeBSD, OpenBSD, Mac OS X, and the Raspberry Pi (Raspbian OS). Savvy users are encouraged to build MassMine from source (and share their experiences). Build instructions follow below.
...

## Step 1: Download Current Version: 1.1.0 (2018-06-06)

Download a copy of the latest version for your computer's architecture:
<ul class="install-list">
  <li><a href="http://www.massmine.org/downloads/massmine-1.1.0-linux-x86_64.zip"><i class="fa fa-download"></i>   MassMine for 64 bit Linux (zip)</a> | <b>MD5 checksum:</b> df6e6008544a3f0551dbfba97e716c59</li>
  <li><a href="http://www.massmine.org/downloads/massmine-1.0.2-OSX-10.10.5.zip"><i class="fa fa-download"></i>   MassMine for macOS (zip)</a> | <b>MD5 checksum:</b> cd1ddabe76eb50e2e0df7180ddff2d76</li>
  <li><a href="http://www.massmine.org/downloads/massmine-1.1.0-linux-ARM.zip"><i class="fa fa-download"></i>   MassMine for Raspberry Pi--Raspbian OS (zip)</a> | <b>MD5 checksum:</b> b21b6932bbb0bcb42207b79dc3db2568</li>
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
* test

The openssl egg requires the openssl development libraries installed on your system. These can be installed with most package managers (e.g., apt-get, pacman, brew, etc.).

For example, on Ubuntu:

    sudo apt-get install libssl-dev

Assuming Chicken Scheme has been properly installed, these eggs (packages) can be installed in a single command:

    chicken-install clucker args openssl medea srfi-19 pathname-expand html-parser test

Building MassMine is simple once Chicken is properly installed:

### Clone the git repository into a directory of your choice

    git clone https://github.com/n3mo/massmine.git

### Test massmine

MassMine comes with a test suite. Before compiling, run the unit tests from within the cloned massmine directory:

    ./massmine.scm --test ./tests/run.scm
	
If all goes well, you should see a series of successes similar to the following:

    -- testing MassMine Core -----------------------------------------------------
    Examples ............................................................. [ PASS]
    Arg Options .......................................................... [ PASS]
    String prefix checking ............................................... [ PASS]
    Date handling ........................................................ [ PASS]
    4 tests completed in 0.002 seconds.
    4 out of 4 (100%) tests passed.
    -- done testing MassMine Core ------------------------------------------------
     
     
    -- testing Google Module -----------------------------------------------------
    Google task descriptions ............................................. [ PASS]
    Google task options .................................................. [ PASS]
    Country Code Identification .......................................... [ PASS]
    Google country trends ................................................ [ PASS]
    Google trends ........................................................ [ PASS]
    5 tests completed in 16.72 seconds.
    5 out of 5 (100%) tests passed.
    -- done testing Google Module ------------------------------------------------
     
     
    -- testing Tumblr Module -----------------------------------------------------
    Tumblr task descriptions ............................................. [ PASS]
    Tumblr task options .................................................. [ PASS]
    Tumblr hostname parsing [1/2] ........................................ [ PASS]
    Tumblr hostname parsing [2/2] ........................................ [ PASS]
    4 tests completed in 0.002 seconds.
    4 out of 4 (100%) tests passed.
    -- done testing Tumblr Module ------------------------------------------------
     
     
    -- testing Twitter Module ----------------------------------------------------
    Twitter task descriptions ............................................ [ PASS]
    Twitter task options ................................................. [ PASS]
    Search rate limit .................................................... [ PASS]
    Trends rate limit .................................................... [ PASS]
    Timeline rate limit .................................................. [ PASS]
    Friends rate limit ................................................... [ PASS]
    Followers rate limit ................................................. [ PASS]
    7 tests completed in 0.004 seconds.
    7 out of 7 (100%) tests passed.
    -- done testing Twitter Module -----------------------------------------------
     
     
    -- testing Web Module --------------------------------------------------------
    Web task descriptions ................................................ [ PASS]
    Web task options ..................................................... [ PASS]
    Web url to string capture ............................................ [ PASS]
    Web text extraction .................................................. [ PASS]
    4 tests completed in 0.973 seconds.
    4 out of 4 (100%) tests passed.
    -- done testing Web Module ---------------------------------------------------
     
     
    -- testing Wikipedia Module --------------------------------------------------
    Wikipedia task descriptions .......................................... [ PASS]
    Wikipedia task options ............................................... [ PASS]
    Wikipedia url builder ................................................ [ PASS]
    Number padding ....................................................... [ PASS]
    Month counter ........................................................ [ PASS]
    Date span aggregator ................................................. [ PASS]
    Wikipedia page links ................................................. [ PASS]
    Wikipedia search ..................................................... [ PASS]
    Wikipedia text ....................................................... [ PASS]
    Wikipedia views ...................................................... [ PASS]
    10 tests completed in 9.85 seconds.
    10 out of 10 (100%) tests passed.
    -- done testing Wikipedia Module ---------------------------------------------

### Compile MassMine into a single executable

From within the root folder of the cloned repo run:

    csc massmine.scm

which will create a single executable called `massmine`. Put that executable on your path and you should be ready to go.
