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
To perform any analysis, you must read the data in one of two ways:

1. Load the entire dataset into memory
2. Read the data file one line at a time

Option 2 is sometimes necessary for extremely large data sets, but requires (arguably) more difficult analysis algorithms designed to operate on streaming, line-by-line data.

Thankfully, memory is cheap and most data sets can safely be loaded into memory all at once. Which option is appropriate depends largely on how much RAM your computer has. The following code snippets share how to accomplish option 1.

## Read a CSV dataset into memory in the R Statistical Language
This section assumes you have converted your massmine JSON data into CSV format (see above).

The following snippet assumes your data is in CSV format in a file called "mydata.csv". Replace the filename when appropriate:

    # Read the data into memory. Here we store the results in a
	# data frame called tweets
	tweets <- read.csv("mydata.csv", header = TRUE, stringsAsFactors = FALSE)
	
	# Data columns can be viewed with the names() function:
	names(tweets)
	
	# To extract a given column, use the $ syntax. For example, to extract
	# the tweet text for every tweet, use
	tweets$text
	
