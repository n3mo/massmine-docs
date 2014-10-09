massmine-docs
=============

Webpage for [http://www.massmine.org](MassMine.org). The site is made with [http://mbutterick.github.io/pollen/doc/index.html](Pollen).

Install Racket Scheme:

    Download the install script from [http://download.racket-lang.org/](Racket-Lang.org)
	Run the shell script (this may require sudo) to install

Install Pollen:

	raco pkg install pollen

Start a local version at [http://localhost:8080](http://localhost:8080):

	raco pollen start

Build the website with

	raco pollen render

Create a deployable version with Pollen markup files removed (saved to your local disk at ~/clone)

	raco pollen clone
