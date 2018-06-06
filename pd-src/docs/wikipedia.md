---
title: Wikipedia tasks
...
Check out the [general usage examples](/docs/config.html) to learn how to use MassMine. Below is a description of the tasks available for Wikipedia.

Task parameters marked * are required. For parameters marked with a + choose only one.

<hr/>

# wikipedia-page-links

Returns all links embedded in a given Wikipedia page.

## Parameters

- **query***: Wikipedia page title, case sensitive.

## Example

    massmine --task=wikipedia-page-links --query=Earl_Grey_tea

# wikipedia-search

Search wikipedia by keyword. Meta-information for all pages containing matches to the search query are returned.

## Parameters

- **query***: Wikipedia page title, case sensitive.

## Example

    massmine --task=wikipedia-search --query=bergamot

# wikipedia-text

Returns the full text (plain text, with formatting removed) of a given Wikipedia page.

## Parameters

- **query***: Wikipedia page title, case sensitive.
- **lang***: Wikipedia language (e.g., en for English, sp for Spanish, etc.)

## Example

    massmine --task=wikipedia-text --query=Earl_Grey_tea --lang=en

# wikipedia-trends

Returns the 1000 most viewed articles on Wikipedia for a given month or day.

## Parameters

- **date** YYYY-MM or YYYY-MM-DD

## Example

    massmine --task=wikipedia-trends --date=2018-04
    ## Or, for a specific day
	massmine --task=wikipedia-trends --date=2018-04-05

# wikipedia-views

Returns the daily page views for a given Wikipedia page for a given date range

## Parameters

- **query***: Wikipedia page title, case sensitive.
- **date***: Date range, as YYYY-MM-DD:YYYY-MM-DD or YYYY-MM-DD-HH:YYYY-MM-DD-HH

## Example

    massmine --task=wikipedia-views --query=Earl_Grey_tea --date=2018-03-01:2018-03-15

