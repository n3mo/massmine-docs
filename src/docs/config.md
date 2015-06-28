((title . "MassMine Configuration")
 (layouts "docs.sxml"))

# Using and Configuring MassMine 

You control MassMine's behavior with user configuration files. These files are [YAML](http://en.wikipedia.org/wiki/YAML) formatted (that is, they are structured for a computer to read, but are also human-readable). An example configuration file called *mmconfig* is included with MassMine in the "examples" folder of your installation. As you begin to use MassMine, a useful strategy is to copy the example file to another location and then the edit the copy. While editing, change the text according to your goals, but preserve the indentation patterns. 

Think of configuration files as a set of simple instructions you would like MassMine to carry out. The contents of the config files are organized hierarchically, with information grouped by the level of indentation. Importantly, the amount of indentation is not important provided you are consistent throughout. The contents of your configuration file depend upon your research objectives, but the creation of a sample config file is described below to demonstrate the logic of controlling MassMine. 

## Usage

When started, you can specify a custom configuration file by including the file name after the call to MassMine. Assuming you have a file called “my-config” in the same directory you are working in, you can start MassMine as follows:

    ~/path/to/massmine my-config

If you do not specify a configuration file in this manner, MassMine will search for a configuration file called "mmconfig" in the following locations, in this order:

1. In the current directory that you're calling MassMine in.
2. In the "examples" folder of the MassMine installation, wherever it was installed on your computer.

If no file can be found in these locations, MassMine stops with an error.


## Example Walkthrough

Imagine that you are interested in identifying Twitter [hashtags](https://en.wikipedia.org/wiki/Hashtag) associated with an ongoing political election, with the eventual goal of tracking the most popular hashtags that you discover. A sensible starting point might be to collect 1000 tweets that include the keyword "election". Later, you will process those tweets to identify any #hashtags present in the data. To accomplish this task, your configuration file should contain information regarding:

1. **service**: Which service you would like use (Twitter, in this example)
2. **authentication**: Your Twitter authorization credentials
3. **task**: Instructions describing what data you want to collect

### Service

MassMine can target multiple sources of online data. To choose which source you would like to target, you specify a *service*. In our example, we want to target twitter. To do so, we include the following text in our configuration file:

    service : twitter

### Authentication

To use Twitter, you must include information regarding your Twitter account application(s) using the configuration options `mm_apps`, `mm_keys`, and `mm_secrets`. An example config file might include:

    mm_apps:
     - TwitterAppName
     
    mm_keys:
     - YourKeyGoesHere
     
    mm_secrets:
     - YourSecretGoesHere

The value of `mm_apps` is the name of your Twitter application. You are free to call this whatever you like, and this value will only be used when MassMine walks you through the authentication process for the first time. `mm_keys` and `mm_secrets` should include the key and secret codes provided to you by Twitter (see the detailed [Twitter documentation](/docs/twitter.html) for more information))

If you manage multiple Twitter application accounts, you can include them all easily. If you provide multiple accounts in this fashion, MassMine will offer a choice of which account to authenticate with:

    mm_apps:
     - TwitterAppName1
     - TwitterAppName2
     
    mm_keys:
     - YourKeyGoesHere1
     - YourKeyGoesHere2
     
    mm_secrets:
     - YourSecretGoesHere1
     - YourSecretGoesHere2

### Task

We have decided to target the service *Twitter*. Now, we must tell MassMine what information we are interested in. In our configuration file, this amounts to identifying a *task*, along with various *options*. The MassMine [Twitter documentation](/docs/twitter.html) contains a complete listing of twitter *tasks* and *options*. For our example, we want to fetch 1000 existing tweets that match a given search query (i.e., tweets that include the word "election"). To accomplish this, we can use the "search" *task* with several options:

    twitter:
     task : search 
     options:
      file.name : twitter_data.csv
      query     : election
      tweets    : 1000

Notice that "task" and "options" are indented relative to the line containing "twitter:". This indicates that the information on these lines corresponds to the line "twitter:". Under "options:" we find three additional configurations, each indented further still.

The option "file.name" indicates the file name into which the resulting Twitter data will be written. With "query" we are able to specify our search term, and with "tweets" we indicate that we desire 1000 matching tweets.

Are you confused about how you were supposed to know to use the options "file.name," "query," and "tweets?" That's alright---you weren't supposed to know. That's what this documentation is for! To learn about all of the tasks and options that are available for accessing Twitter, read the [full documentation](/docs/twitter.html).

### Putting It All Together

Combining the configuration settings from above, we can create a single configuration file called "my-config" that contains the following lines:

    service : twitter
     
    mm_apps:
     - TwitterAppName
     
    mm_keys:
     - YourKeyGoesHere
     
    mm_secrets:
     - YourSecretGoesHere
     
    twitter:
     task : search 
     options:
      file.name : twitter_data.csv
      query     : election
      tweets    : 1000

Assuming the file we created is in the same directory that we are working in, we can now run MassMine accordingly by specifying the file:

    ~/path/to/massmine my-config

which will eventually create a file called "twitter_data.csv". At the time of this writing, a quick analysis of the results reveals that the top 10 hashtags were #vicvotes, #CameronMustGo, #VicVotes, #tcot, #auspol, #Green14, #ccot, #ASeasonOfMiracles, #Macedon, and #pjnet. 
