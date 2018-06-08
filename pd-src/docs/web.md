---
title: Web (URL) Scraping Tasks
...
Check out the [general usage examples](/docs/config.html) to learn how to use MassMine. Below is a description of the tasks available for web (URL) scraping.

Task parameters marked * are required. For parameters marked with a + choose only one.

<hr/>

# web-text

Returns the text from one or more supplied URLs with html tags removed. If you only want the plain text from a webpage, and don't care about the underlying structure (lists, tables, etc.), then this is the quickest method for extracting webpage content.

## Parameters

- **query***: One or more URLs, separated by spaces

## Examples

    # Scrape the text from a single webpage
    massmine --task=web-text --query=http://www.massmine.org

    # Scrape multiple webpages at once
	  massmine --task=web-text --query='http://www.massmine.org http://www.call-cc.org/'
