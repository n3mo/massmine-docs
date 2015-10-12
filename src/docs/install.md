((title . "MassMine Installation")
 (layouts "docs.sxml"))

# Installation

MassMine is designed to run on Linux and Mac OSX. Pre-built, self-contained application bundles are available for both. Installation is as simple as downloading the latest zip or tarball and unpacking the files. Currently, versions are available for 64 bit operating systems.

MassMine should run on most versions of Linux, FreeBSD, OpenBSD, and Mac OS X. Savvy users are encouraged to build MassMine from source (and share their experiences). Build instructions follow below.

## Step 1: Download

Download a copy of the latest version for your computer's architecture

<div><a href="http://www.massmine.org/downloads/massmine-0.10.0-linux-x86_64.zip"><img alt="Download MassMine" src="/images/download_icon.png" height="50" width="50" style="vertical-align:middle">   MassMine for 64 bit Linux (zip)</a> | <b>MD5 checksum:</b> 8c2f585201de1ed121af11d792036974</div>


<div><a href="http://www.massmine.org/downloads/massmine-0.10.0-linux-x86_64.tar.gz"><img alt="Download MassMine" src="/images/download_icon.png" height="50" width="50" style="vertical-align:middle">   MassMine for 64 bit Linux (tar.gz)</a> | <b>MD5 checksum:</b> 82bae0322c8af3f7973274c0517dd067</div>

<div><a href="http://www.massmine.org/downloads/massmine-0.10.0-OSX-10.10.zip"><img alt="Download MassMine" src="/images/download_icon.png" height="50" width="50" style="vertical-align:middle">   MassMine for OS X (zip)</a> | <b>MD5 checksum:</b> 734f35c986d322998f3e6b2a5afe65cc</div>


<div><a href="http://www.massmine.org/downloads/massmine-0.10.0-OSX-10.10.tar.gz"><img alt="Download MassMine" src="/images/download_icon.png" height="50" width="50" style="vertical-align:middle">   MassMine for OS X (tar.gz)</a> | <b>MD5 checksum:</b> 40edc6531450e82b8c517421ac2f3338</div>
<div class="hint">A custom package has been built for University of Florida Research Computing users. This bundle contains both MassMine and a data cleaning tool called <a href="https://github.com/n3mo/jsan">jsan (The JSON Swiss Army kNife)</a>

<br><br>
<div><a href="http://www.massmine.org/downloads/massmine-toolkit-hipergator.zip"><img alt="Download MassMine" src="/images/download_icon.png" height="50" width="50" style="vertical-align:middle">   MassMine Toolkit (zip format)</a> | <b>MD5 checksum:</b> f8184e7391f2de62402c2113b33a4c0d</div>
<div><a href="http://www.massmine.org/downloads/massmine-toolkit-hipergator.tar.gz"><img alt="Download MassMine" src="/images/download_icon.png" height="50" width="50" style="vertical-align:middle">   MassMine Toolkit (tar.gz format)</a> | <b>MD5 checksum:</b> aa97119390ad5e0cca5f41f5f8a554e2</div>
</div>

## Step 2: Install

Unpack the downloaded file, replacing all "x.x.x" with the version number you downloaded:

For zipped packages

    unzip massmine-x.x.x-linux-x86_64.zip

For tarballs

    tar -xzf massmine-x.x.x-linux-x86_64.tar.gz

Either of the above commands will produce a directory called "massmine". This is all you need to get working! Move this directory to somewhere in your file system for safe keeping.

Inside the directory "massmine" you will find an executable file called `massmine`. You can run this directly to get started right away. Working from inside the "massmine" directory:

    ./massmine --help

Even better, make the `massmine` command available from anywhere on your computer by creating a symbolic link to the executable somewhere on your path. Again, working from within the "massmine" directory, run:

    ln -s `pwd`/massmine /usr/local/bin

You may need administrator privileges for that last command, in which case try:

    sudo ln -s `pwd`/massmine /usr/local/bin

That's it! You're ready to use massmine. To get started, try running:

    massmine --help

<div class="hint">Once massmine is installed, work from within a different directory than the installed "massmine" folder. Leave these important files be!</div>

# Building From Source

Technically savvy users can build the massmine application from source. Does this sound mysterious? If so, try using the pre-packaged applications described in the installation instructions above. The remaining build instructions assumes knowledge of many common (and some uncommon) build tools.

## Use The Source

Grab the code:

    git clone https://github.com/n3mo/massmine.git

... magic... and you're done!
