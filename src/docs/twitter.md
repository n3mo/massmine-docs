((title . "MassMine: Twitter")
 (layouts "docs.sxml"))

# Twitter
<div class="hint">To access Twitter using MassMine you must first authenticate. This is a requirement of Twitter. <a href="/docs/authorization.html">Authorization is simple</a>, and only has to be completed once.</div>

To authenticate with Twitter, run

    massmine --task=twitter-auth

Check out the [general usage examples](/docs/config.html) to learn how to use MassMine. Below is a description of the tasks available for Twitter.

Task parameters marked * are required. For parameters marked with a + choose only one.

## Tasks

<br></br>
<div class="task">twitter-auth</div>

Sets up MassMine to make data requests under your Twitter account privileges. This task *must* be ran before using any other Twitter tasks, or an error will be returned.

### Parameters

<none>

### Example

    massmine --task=twitter-auth

<br></br><br></br>
<div class="task">twitter-followers</div>

Returns information each follower for a specified user.

### Parameters

- **user***: A Twitter user name

### Example

    massmine --task=twitter-followers --user=quinoa

<br></br><br></br>
<div class="task">twitter-friends</div>

Returns information on each friend of a specified user.

### Parameters

- **user***: A Twitter user name

### Example

    massmine --task=twitter-friends --user=quinoa

<br></br><br></br>
<div class="task">twitter-locations</div>

Returns a list of valid geo-locations [as Yahoo Where on Earth Indentifiers (WOEIDS)](https://developer.yahoo.com/geo/geoplanet/guide/concepts.html) accepted by Twitter. These WOEIDs can be used with some Twitter tasks that accept a *geo* parameter.

### Parameters

<none>

### Example

    massmine --task=twitter-locations

<br></br><br></br>
<div class="task">twitter-sample</div>

Returns a random sample of tweets as they occur in *real time*. Up to 1% of Twitter's actual volume is returned. Returns up to a maximum number of tweets requested OR until a specified date/time is reached. Both "count" and "dur" can be specified, in which case the task finished whenever either target is reached.

### Parameters

- **count**: (Optional) Maximum number of tweets to return
- **dur**: (Optional) Deadline, as 'YYYY-MM-DD HH:MM:SS'

### Example

    # Request a specified number of tweets
    massmine --task=twitter-sample --count=50

    # Or, keep collecting until a time is reached
    massmine --task=twitter-sample --dur='2015-10-11 14:30:00'

    # This will finish whenever 50 tweets or the deadline is reached,
    # whichever occurs first
	massmine --task=twitter-sample --dur='2015-10-11 14:30:00' --count=50

<br></br><br></br>
<div class="task">twitter-search</div>

Search for *pre-existing* tweets matching a given search phrase. Not all tweets are indexed and made available by Twitter's search, and search-able tweets are indexed for the last 7 days only. For better search coverage, consider using the *twitter-stream* task to capture tweets as they occur in real time.

### Parameters

- **query***: Search query string, using Twitter's search formatting (see search operators at [Twitter's search site](https://twitter.com/search)).
- **count**: (Optional) Maximum number of tweets to return.
- **geo**: (Optional) Return tweets from a location specified by 'latitude,longitude,radius', where radius can be specified either as "mi" (miles) or "km" (kilometers). For example, '37.781157,-122.398720,1mi'
- **lang**: (Optional) Return tweets of a given language, specified by an [ISO 639-1 code](http://en.wikipedia.org/wiki/List_of_ISO_639-1_codes).

### Example

    # Looking for love...
	massmine --task=twitter-search --query=love --count=300

    # ... in only certain places
    massmine --task=twitter-search --query=love --count=300 --geo=37.781157,-122.398720,1mi

    # ... in French
    massmine --task=twitter-search --query=amour --count=300 --lang=fr

<br></br><br></br>
<div class="task">twitter-stream</div>

Returns tweets as they occur in *real time*, matching either a search phrase, a user name, or a location. Up to 1% of Twitter's actual volume is returned. Returns up to a maximum number of tweets requested OR until a specified date/time is reached. Both "count" and "dur" can be specified, in which case the task finished whenever either target is reached.

### Parameters

- **query+**: Search query string, using Twitter's search formatting (see search operators at [Twitter's search site](https://twitter.com/search)).
- **user+**: A Twitter user name to track. Multiple user names can be separated with commas.
- **geo+**: A bounding box described as longitude and latitude pairs, with the southwest corner of the box first, and the northeast corner second. For example, '-122.75,36.8,-121.75,37.8' specifies a box around San Francisco. Multiple boxes can be passed at once, with '-122.75,36.8,-121.75,37.8,-74,40,-73,41' specifying either San Francisco OR New York City.
- **lang**: (Optional) Return tweets of a given language, specified by an [ISO 639-1 code](http://en.wikipedia.org/wiki/List_of_ISO_639-1_codes).
- **dur**: (Optional) Deadline, as 'YYYY-MM-DD HH:MM:SS'
- **count**: (Optional) Maximum number of tweets to return.

### Example

	# Search by keyword, with a max count OR deadline
    massmine --task=twitter-stream --query=love --count=300 --dur='2015-10-11 14:30:00' --count=50

    # Track a user in real time (may only make sense for HIGHLY active accounts).
    # Here we track multiple users
	massmine --task=twitter-stream --user=nasa,wired --dur='2015-10-11 14:30:00'

    # Or, simply grab tweets coming out of New York City
    massmine --task=twitter-stream --geo=-74,40,-73,41 --count=300

<br></br><br></br>
<div class="task">twitter-trends</div>

Returns the top-10 trends for a given location.

### Parameters

- **geo***: A location specified as a [Yahoo Where on Earth Indentifier (WOEID)](https://developer.yahoo.com/geo/geoplanet/guide/concepts.html). For a list of available WOEIDs, see the *twitter-locations* task.

### Example

    # Current trends in Seattle, Washington
    massmine --task=twitter-trends --geo=2490383

<br></br><br></br>
<div class="task">twitter-trends-nohash</div>

Returns the top-10 trends for a given location, with #hashtags excluded.

### Parameters

- **geo***: A location specified as a [Yahoo Where on Earth Indentifier (WOEID)](https://developer.yahoo.com/geo/geoplanet/guide/concepts.html). For a list of available WOEIDs, see the *twitter-locations* task.

### Example

    # Current trends in Seattle, Washington
    massmine --task=twitter-trends-nohash --geo=2490383

<br></br><br></br>
<div class="task">twitter-user</div>

Returns 1 or more users timelines (i.e., their tweet history), in reverse chronological order.

### Parameters

- **user***: A Twitter user name, or multiple user names separated by commas.
- **count**: (Optional) Maximum number of tweets to return, up to 3200 (max limit set by Twitter)

### Example

    # Let's get the last 10 tweets from NASA
    massmine --task=twitter-user --user=nasa --count=10

    # We can fetch 10 from both NASA and Wired in one shot:
    massmine --task=twitter-user --user=nasa,wired --count=10
