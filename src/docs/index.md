((title . "MassMine Documentation")
 (layouts "docs.sxml"))

<div style="padding:20px;margin-left:auto;margin-right:auto;width:319px"><img src="https://github.com/n3mo/massmine/raw/master/img/splash.png" heigth="463"; width="319";></div>

MassMine is a research tool designed to simplify the collection and use of data from social media outlets.

Specifically, MassMine:

* Is designed for use on personal computers or on servers/clusters.
* Handles the acquisition of data from sites such as Twitter, Facebook, etc.. 
* Makes setting up custom data requests easy, allowing for flexible deployment for individualized research needs.
* Creates and manages databases of collected data automatically. This means that all tweets, trends, posts, etc. related to your research questions are saved permanently on your local hard drive. 
* Is designed for long-running data collection projects. MassMine makes it easy to create your own database of social media content spanning days, months, or years.
* Balances ease of use with powerful flexibility:
    * Offers full access to social media APIs. 
    * Designed for the non-programmer looking to get into big data research, but offers alternative functionality for power users.
* Runs in several modes:
    1. **Setup**. This mode walks the user through the setup process, creating template files, setting up authorization with social media sites, etc..
    2. **Automated**. This mode makes it easy to run the software on remote servers. MassMine can be set to automatically restart after server crashes to help minimize any loss of data.
    3. **Interactive**. Power users can opt to run MassMine interactively in an already running R session. This allows for full control over the functionality of MassMine, as well as the ability to work with the resulting databases.
