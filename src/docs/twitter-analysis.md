((title . "MassMine: Twitter Analysis")
 (layouts "docs.sxml"))

Now that you have [collected data from Twitter](/docs/twitter.html), what can you do with it? The particulars of any analysis are strongly dictated by the hypotheses being tested. However, many investigations share a common set of objectives early on in their analysis. Solutions to some of these problems are shared below.

# Converting JSON to comma-separated-values (.csv) format

MassMine returns data from all sources as JSON. Depending on your analysis workflow, it can be more desirable to work in a column-oriented data format (such as csv format), such as when importing data into R, Python, SPSS, Excel, or similar. A [companion tool has been created called jsan](https://github.com/n3mo/jsan) (The **J**SON **S**wiss **A**rmy k**N**ife) that provides quick and memory-efficient conversion into column-oriented data formats.

`jsan` can be used after data has been collected. For example:

    # Fetch some data first
    massmine --task=twitter-search --count=200 --query=love --output=mydata.json

    # Convert the JSON from above into .csv, keeping the
    # "text" and "user:screen_name" fields
	jsan --input=mydata.json --output=mydata.csv --keep text user:screen_name

Which data fields are available for conversion to csv? This depends on what you have requested from Twitter. If you have collected Twitter data using massmine into a file called "mydata.json", you can determine which "columns" (i.e., which data fields) are available with `jsan` using the `--list` option. The values printed by the following command can be passed to `jsan` with either the `--keep` or `--remove` options. 

    jsan --input=mydata.json --list


For large data sets, such as when pulling data from the twitter-stream task, it can be advantageous to utilize the streaming capabilities of `massmine` and `jsan` to allow conversion while data is being collected:

    # Big request, piped into jsan using tee to create a .json file AND a .csv
    # copy of the desired fields. This saves the headache of converting a huge
    # file later
	massmine --task=twitter-stream --query=love --count=2000000 | tee mydata.json | jsan --output=mydata.csv --keep text user:screen_name

To learn more about using `jsan`, please check the [official documentation online](https://github.com/n3mo/jsan).

# Loading a massmine dataset into statistical software
To perform any analysis, you must process the data in one of two ways:

1. Load the entire dataset into memory
2. Read the data file one line at a time

Option 2 is sometimes necessary for extremely large data sets, but requires (arguably) more difficult analysis algorithms designed to operate on streaming, line-by-line data.

Thankfully, memory is cheap and most data sets can safely be loaded into memory all at once. Which option is appropriate depends largely on how much RAM your computer has. The following code snippets share how to accomplish option 1.

## Read a CSV dataset into memory in the R Statistical Language
This section assumes you have converted your massmine JSON data into CSV format (see above).

The following snippet assumes your data is in CSV format in a file called "mydata.csv". Replace the filename when appropriate:

    ## Read the data into memory. Here we store the results in a
	## data frame called tweets
	tweets <- read.csv("mydata.csv", header = TRUE, stringsAsFactors = FALSE)
	
	## Data columns can be viewed with the names() function:
	names(tweets)
	
	## To extract a given column, use the $ syntax. For example, to extract
	## the tweet text for every tweet, use
	tweets$text
	
## Read a CSV dataset into memory in Racket Scheme
This section assumes you have converted your massmine JSON data into CSV format (see above).

The following snippet assumes your data is in CSV format in a file called "mydata.csv". Replace the filename when appropriate:

	;;; Required dependency: csv-reading. 
	;;; Install with `raco pkg install csv-reading`
	(require csv-reading)

    ;;; Read the data into memory. Here we store the results in a 
	;;; list of lists called tweets
	(define tweets (with-input-from-file "mydata.csv"
		 (λ () (csv->list (current-input-port))))) 
		 
	;;; Data columns can be view by inspecting the first row (i.e., list)
	(first tweets)
	
	;;; Assuming the tweet text is the third "column", we index it with 2 
	;;; (Racket uses zero-indexing). This will return every tweet's text in 
	;;; your data set
	(map (λ (x) (list-ref x 2)) tweets)
	
# "Cleaning" text strings
Often, it is advisable to pre-process, or "clean," text before beginning any complex analysis. This can take many forms, but often includes:

1. **Homogenizing character encoding**: Some text is represented as ASCII, some as Unicode. Unicode allows for many more characters and is the preferred encoding scheme. Sometimes it is necessary to convert heterogeneous encoding into a common scheme. This is especially true if data from multiple sources will be combined.
2. **Removing capitalization**: When calculating word frequencies, for example, the difference between "home," "Home," "HOME," etc. is uninteresting. Typically, it's more useful to treat these variations as the same word. This is more easily accomplished by first converting all letters to lowercase.
3. **Collapsing whitespace**: Users often include extra whitespace in their posts, including spaces, tabs, newlines, etc. Typically, these are not meaningful components of the message. Collapsing whitespace usually involves converting sequences of whitespace into single space characters.
4. **Removing punctuation**: Punctuation can be meaningful, such as emoji sequences that convey emotion. Often, punctuation is not meaningful. In these situations, it adds spurious artifacts in an analysis. In these situations, removing punctuation can be stripped out to leave just the words contained in a message.

## Homogenizing character encoding in the R Statistical Language
The following code snippets assume your dataset is loaded into R as a data frame called `tweets` (see above)

    ## Convert, as necessary, character encoding to Unicode UTF-8
	tweets$text <- iconv(tweets$text, "", "UTF-8")

## Removing capitalization in the R Statistical Language
The following code snippets assume your dataset is loaded into R as a data frame called `tweets` (see above)

	## Lowercase everything
	tweets$text <- tolower(tweets$text)

## Collapsing whitespace in the R Statistical Language
The following code snippets assume your dataset is loaded into R as a data frame called `tweets` (see above)

    ## Collapse extra whitespace into single space characters
	tweets$text <- gsub("[[:space:]]+", " ", tweets$text)

## Removing punctuation in the R Statistical Language
The following code snippets assume your dataset is loaded into R as a data frame called `tweets` (see above)

    ## Heavy handed approach. This removes all punctuation.
    tweets$text <- gsub("[[:punct:]]+", " ", tweets$text)

Web links (URLs) are problematic, as they are a mixture of punctuation and characters. If your data contains many URLs, consider removing them *BEFORE* removing punctuation. Matching URLs is very difficult. The following trick does a decent job of stripping URLs, and then removes punctuation:

    ## Remove URLs
    tweets$text <- gsub("(http|https)([^/]+).*", " ", tweets$text)
	
    ## Now remove punctuation
    tweets$text <- gsub("[[:punct:]]+", " ", tweets$text)
	
# Identifying hashtags
What hashtags are present in your data? It's easy to find out!

## Listing hashtags in the R Statistical Language
The following code snippets assume your dataset is loaded into R as a data frame called `tweets` (see above)

    ## What hashtags do we find across all tweets?
	
