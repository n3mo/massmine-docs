((title . "MassMine: Google Trends")
 (layouts "docs.sxml"))

# Google Trends

Check out the [general usage examples](/docs/config.html) to learn how to use MassMine. Below is a description of the tasks available for Google Trends.

Task parameters marked * are required. For parameters marked with a + choose only one.

## Tasks

<br></br>
<div class="task">google-country-trends</div>

Returns the top 20 trending search phrases on Google for each documented country on Google trends.

### Parameters

<none>

### Example

    massmine --task=google-country-trends

<br></br><br></br>
<div class="task">google-trends</div>

Returns the top 20 trending search phrases, along with meta data including the lower bound on number of searches, on Google for the United States for a given date.

### Parameters

- **date***: formatted as YYYY-MM-DD

### Example

    massmine --task=google-trends --date=2015-10-11

