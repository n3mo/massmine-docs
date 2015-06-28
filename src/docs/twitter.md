((title . "MassMine: Twitter Services")
 (layouts "docs.sxml"))

# Authenticating With Twitter

If you are using the Twitter functionality of MassMine, you must authenticate with the Twitter servers. This is a requirement of Twitter. To do so, you must log in to (or create) an account at [Twitter's Developer Site](https://dev.twitter.com). Once logged in, you must create a new "application" at [Twitter's Application Site](https://apps.twitter.com/). In your configuration file, edit the entries for "key" and "secret" to include the corresponding codes provided to you by Twitter. You should also provide a name for your Twitter account in your configuration file. 

When you attempt to use MassMine to access Twitter for the first time, you will be asked to authenticate your account. In a terminal, you must enter the following commands:

    cd ~/path/to/massmine
    R

This will start an R process. At the R prompt, enter:

    source("massmine")

When you enter the `source("massmine")` command, you will be prompted with an authentication process. Follow the provided web link and enter the numeric code provided to you. Upon success, MassMine will be ready for use with Twitter. You can now quit R with `q()` (choosing "no" when asked about saving your session).

MassMine is now ready to work with Twitter. You can now start MassMine directly at any time, and you will never have to authenticate with Twitter again:

    ~/path/to/massmine

# Accessing Twitter Records

MassMine offers a collection of *tasks* for retrieving information from Twitter. The following tasks are currently supported, and are chosen by editing the "task" field in your configuration file. Many of these tasks can be customized by setting one of many available options. Options for each task are described below. 

◊table{
| Twitter Task                              | Description                                                 |
|-------------------------------------------+-------------------------------------------------------------|
| [test](/docs/twitter.html#test)           | An automated test suite for MassMine                        |
| [search](/docs/twitter.html#search)       | Search Twitter's Rest API by keyword                        |
| [locations](/docs/twitter.html#locations) | Returns a list of valid Where On Earth Identifiers (woeids) |
| [timeline](/docs/twitter.html#timeline)   | Retrieve up to 3200 tweets from specific users              |
| [trends](/docs/twitter.html#trends)       | Monitor top-10 trends for one or more locations             |
| [stream](/docs/twitter.html#stream)       | Capture live tweets as they happen                          |
}

## Test

A suite of tests to ensure that MassMine is communicating successfully with Twitter. When accessing Twitter for the first time with MassMine, conducting a test with this task will ensure that everything is operating properly.

◊table{
| Option      | Description                           | Example |
|-------------+---------------------------------------+---------|
| **verbose** | Print lots of diagnostic information? | FALSE   |
}

* **verbose**: This is the only option available. By default it is set to FALSE. If you need to diagnose a problem when a test fails, rerun the test again and set the option to TRUE.

## Search

Search past records (tweets) on Twitter. The search task allows the user to target Twitter's Rest API to fetch past tweets matching a given search query. Results are saved to disk. Configuration options include:

◊table{
| Option        | Description                                       | Example                |
|---------------+---------------------------------------------------+------------------------|
| **file.name** | File destination for tweet data                   | tweet_data.csv         |
| **query**     | Search query                                      | florida gators         |
| **tweets**    | Number of Twitter records to return (default=25)  | 500                    |
| **lang**      | Language to restrict results to                   | en                     |
| **since**     | Restrict records to those occurring after a date  | 2014-04-22             |
| **until**     | Restrict records to those occurring before a date | 2014-10-03             |
| **geocode**   | Restricts tweets to a given geospatial radius     | 41.8369, 87.6847, 20mi |
}

* **file.name**: (*Required*) Can be any relative (./tweet_data.csv) or absolute (/home/user/tweet_data.csv) file path. Your results will be saved to this file.
* **query**: (*Required*) This is the search term with which you wish to query Twitter. You can include multiple keywords and/or hashtags.
* **tweets**: The number of tweets you would like to receive. Note that malformed tweets will be removed, so you may receive less tweet records than you request. If you do not include this option, a default 25 tweets will be requested.
* **lang**: Specify an [ISO 639-1 code](http://en.wikipedia.org/wiki/List_of_ISO_639-1_codes) to restrict your search to a specific language.
* **since**: If supplied, only tweets created after the date (formatted as YYYY-MM-DD) will be returned.
* **until**: If supplied, only tweets created before the date (formatted as YYYY-MM-DD) will be returned.
* **geocode**: Restrict tweets to a given location. The format is *latitude, longitude, radius*, where *radius* can be mi (miles) or km (kilometers). The example given above is a 20 mile radius centered on Chicago.

## Locations

Returns the full list of available [Where On Earth Identifiers](https://developer.yahoo.com/geo/geoplanet/guide/concepts.html) currently supported by Twitter. Woeids can be used with other twitter tasks to restrict your data collection to particular cities/state/countries. The data returned contains three values (columns) per location: *name*, *country*, and *woeid*.

◊table{
| Option        | Description                        | Example             |
|---------------+------------------------------------+---------------------|
| **file.name** | File destination for location data | woeid_locations.csv |
}

* **file.name**: (*Required*) Can be any relative (./woeid_locations.csv) or absolute (/home/user/woeid_locations.csv) file path. Your results will be saved to this file.

## Timeline

Fetch the timeline (tweets) for a specified user or list of users. This allows for the systematic collection of the tweets of targeted users (the user accounts must either be public or part of your friend base to be accessible). 

◊table{
| Option     | Description                                | Example                              |
|------------+--------------------------------------------+--------------------------------------|
| **outdir** | Destination directory for user data        | ~/research/user_data/                |
| **users**  | User name or file path (see details below) | Ladygaga OR ~/research/user_list.txt |
| **tweets**  | Number of statuses (tweets) to collect     | 3200                                 |
}

* **outdir**: (*Required*) A relative or absolute file path of a directory. Each user's tweets will be saved in a separate file in this directory. Two additional files will be created as well:
    1. fetched_users_XXXX.txt: This file will be created listing which users' data was successfully fetched. The XXXX will be replaced with a unique number.
    2. failed_users_XXXX.txt: This file will be created listing which users' data was *un*successfully fetched. The XXXX will be replaced with a unique number.
    3. user_SCREENNAME.csv: One file per fetched user will be created. SCREENNAME will be replaced in each file name with the appropriate user name. 
* **users**: (*Required*) A valid Twitter user name. If a single name is supplied, that user's data is fetched. Alternatively, you can provide a path to a plain text file containing 1 user name per line and MassMine will fetch the timeline of each user. 
* **tweets**: The number of tweets (statuses) you would like to retrieve from each user. The maximum allowed by Twitter is 3200. If a user has less than the requested number of tweets, their entire tweet history will be returned.

## Trends

Grab the top 10 trends, as defined by Twitter, for one or more locations (woeids). 

◊table{
| Option        | Description                            | Example                 |
|---------------+----------------------------------------+-------------------------|
| **file.name** | File destination for trend data        | trend_data.csv          |
| **woeid**     | Where on earth identifier (up to five) | 2347563 2347596 2347561 |
| **samples**   | Number of times to request trends      | 5                       |
| **hashtags**  | Include hashtags? (TRUE or FALSE)      | TRUE                    |
}

* **file.name**: (*Required*) Can be any relative (./trend_data.csv) or absolute (/home/user/trend_data.csv) file path. Your results will be saved to this file.
* **woeid**: (*Required*) [Where On Earth Identifiers](https://developer.yahoo.com/geo/geoplanet/guide/concepts.html). MassMine will return the top-10 trends for each woeid location supplied on every sample. You must supply at least one location. A maximum of 5 woeids can be requested (due to limitations in Twitter's access rate limits). To determine available woeids, use the *Locations* task.
* **samples**: MassMine will fetch the current top-10 trends for each woeid every five minutes (this is the frequency at which Twitter updates these lists). A new "sample" will be fetched every 5 minutes for *samples* number of times. MassMine supports long running monitoring of trends (i.e., large sample sizes). In the event of network problems preventing access to Twitter, existing data will not be lost, and MassMine will continue to try to connect every 5 minutes for *samples* number of tries.
* **hashtags**: Twitter calculates top-10 trends both with and without including hashtags. By default (TRUE), hashtags are included. Set this to FALSE to have them excluded. 

## Stream

Capture live tweets that match a pattern as they happen.

◊table{
| Option        | Description                                 | Example                      |
|---------------+---------------------------------------------+------------------------------|
| **file.name** | File destination for streaming data         | streaming_data.csv           |
| **track**     | keyword(s) to track                         | osu buckeyes, florida gators |
| **follow**    | A comma-separated list of user IDs to track | 1234567                      |
| **locations** | Longitude-latitude bounding box             | -74,40,-73,41                |
| **lang**      | Language to restrict results to             | en                           |
| **timeout**   | Maximum time to collect tweets              | 0                            |
| **tweets**    | Maximum number of tweets to collect         | 10                           |
| **shrink**    | Save only the most critical data            | FALSE                        |
}

* **file.name**: (*Required*) Can be any relative (./streaming_data.csv) or absolute (/home/user/streaming_data.csv) file path. Your results will be saved to this file.
* **track**: (*Required*) Tweets containing these keywords will be collected from Twitter. Use spaces for logical AND (e.g., "cats dogs" is equivalent to "cats and dogs"), and use commas for logical OR (e.g., "cats, dogs" is equivalent to "cats or dogs").
* **follow**: If you would like to restrict your collection to a specified user or users, you can include their Twitter ID numbers here. Only tweets from these users will be collected (as they match your *track* keywords).
* **locations**: You can specify a bounding box (or boxes) by drawing a rectangle using longitude and latitude coordinates to identify the southwest and northeast corners of the boundary. See [Twitter's documentation](https://dev.twitter.com/streaming/overview/request-parameters#locations) for examples.
* **lang**: Specify a [BCP 47 code](https://en.wikipedia.org/wiki/IETF_language_tag) to restrict your search to a specific language.
* **timeout**: If set to 0, MassMine will continue to collect tweets indefinitely (or until *tweets* number of tweets have been collected). Set to any number of SECONDS to cause MassMine to stop after a given amount of time.
* **tweets**: The maximum number of tweets to collect. MassMine will stop after reaching this number, or when reaching *timeout* number of seconds. You can specify timeout and/or tweets in any combination to achieve your desired collection goal.
* **shrink**: By default, Twitter's streaming API returns a lot of information. Often, you will only need a useful subset of this data. By setting this option to TRUE, the extra data columns will be removed from the resulting data file (this will also reduce the final file size by up to 50%). 