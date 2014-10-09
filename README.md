massmine-docs
=============

Webpage for [MassMine.org](http://www.massmine.org). The site is made with [Pollen](http://mbutterick.github.io/pollen/doc/index.html).

Install [Racket Scheme](http://download.racket-lang.org/)

Install Pollen:

	raco pkg install pollen

Start a local version at [http://localhost:8080/index.ptree](http://localhost:8080/index.ptree):

	raco pollen start

Or build the website with

	raco pollen render

Create a deployable version with Pollen markup files removed (saved to your local disk at ~/clone)

	raco pollen clone
