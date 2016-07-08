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

# wikipedia-views

Returns the daily page views for a given Wikipedia page for a given month.

## Parameters

- **query***: Wikipedia page title, case sensitive.
- **lang***: Wikipedia language (e.g., en for English, sp for Spanish, etc.)
- **date***: Month, as YYYY-MM-DD (day is ignored)

## Example

    massmine --task=wikipedia-views --query=Earl_Grey_tea --lang=en --date=2015-09-01 
