---
title: Using MassMine
...

# Introduction
MassMine's behavior is controlled via options set either directly on the command line, or by using a configuration file (or a combination of both). For most options, MassMine accepts short and long versions. For example, the following long format command

    massmine --count=50

is equivalent to the following short format version

    massmine -c 50

Users are free to use whichever form is preferred, but for the sake of clarity long format options will be used for this documentation.

# Getting Help
MassMine ships with built-in help to familiarize users with features. See what options are available to you with

    massmine --help

This will produce some helpful clues on how to get started. Depending on your version, you should see output similar to the following:

    Usage: massmine ... [options...]
     
     -h, --help               Help information
     -v, --version            Version information
     -p, --project=ARG        Create project
     -a, --auth=ARG           Credentials file
     -o, --output=ARG         Write to file
     -t, --task=ARG           Task name
     -q, --query=ARG          Query string
     -c, --count=ARG          Number of records
     -d, --dur=ARG            Max runtime
     -g, --geo=ARG            Location
     -l, --lang=ARG           Language
     -u, --user=ARG           Screen name
         --date=ARG           Date (or date range)
         --config=ARG         Config file
         --no-splash          Inhibit splash screen
         --test=ARG           Development tests
     
    Retrieve and store data from web sources
     
    See 'massmine -h <option>' to read about a specific topic
        'massmine -h task' will, for example, display help about the 'task' option
    or  'massmine -h task-options' for options supported by each task 
    or  'massmine -h examples' for detailed examples
     
    Full documentation can be found at http://www.massmine.org
    Report bugs to nemo1211 at gmail.

The help printout indicates what options are available, and which can be used with the short or long format syntax.

The help option also accepts keywords matching the available options. For example, to learn more about the --count option you can run

    massmine --help count
	
The above help command produces

    Request a number of records for tasks that accept limits
     
    Example(s): 'massmine --count=100'
                'massmine -c 100'

In addition to per-option help, example commands for collecting data are provided with

    massmine --help examples

# Using and Configuring MassMine

Fetching data using MassMine involves composing a series of options that describe your data collection request. To compose such a request, you must:

1. Choose an appropriate **task**
2. Include any necessary options to specify the details of your data request.

## Choosing a Task

Data access methods in MassMine are referred to as "tasks". Each task corresponds to a different data source. To see a list of all available tasks, use the help functionality:

    massmine --help task

A listing of available tasks is printed to the terminal, each with a brief description. Next, it is important to learn what MassMine options are available for each task. To inspect these options, use

    massmine --help task-options

Some tasks require zero options, such as the "twitter-locations" task. To run such tasks, the command is simply

    massmine --task=twitter-locations

Most tasks, however, accept additional optional and/or required information as described in the help printout.

## Composing Data Requests

Once you know which task you would like, you are ready to compose a data collection request. Let's assume you would like to search for tweets on Twitter that contain the keyword "love". Using `massmine --help task` we learn that the appropriate task to use is called "twitter-search". Next, we use `massmine --help task-options` to determine which options the twitter-search task accepts. We find:

    twitter-search -- query* count geo lang

It seems that we must include the `--query` option. We can also optionally specify `--count` `--geo` and `--lang`. Let's assume that we would like to collect 200 tweets matching the query "love". We can now compose our custom data request:

    massmine --task=twitter-search --count=200 --query=love

Note that the order of the options does not matter. The above command could be rewritten as

    massmine --query=love --count=200 --task=twitter-search

If you run one of the above commands, the resulting data (in JSON format) will be printed to your terminal. This is probably not what you want. MassMine provides two methods for saving your data.

**Option 1: Save directly to disk with massmine**

First, you can use the built-in option `--output` to have MassMine write the data to a file. This options accepts file paths and names (existing files will trigger a warning from massmine). Building on our previous command, we can save our data to the current working directory with:

    massmine --task=twitter-search --count=200 --query=love --output=mydata.json

Include a file path to save to a specific directory (relative and absolute file paths are accepted):

    massmine --task=twitter-search --count=200 --query=love --output=./results/mydata.json

**Option 2: Use shell redirects to save your data**

MassMine is designed to work with tradition Linux/Unix pipelines, so output redirection works:

    massmine --task=twitter-search --count=200 --query=love > mydata.json

as well as piping

    massmine --task=twitter-search --count=200 --query=love | tee output.json

# Alternative Configuration File

For complex MassMine data requests the command line options can become long and unwieldy. For such situations, MassMine can also be controlled via a configuration file by use of the `--config=FILE` option. The configuration file should be a plain text file with the following format:

- Each line should have the format `option = value`, where `option` should be any valid long-format option (e.g., `task` and not `t`).
- `value` can be any valid number or text string (with no quotes).
- Each line should contain only ONE option.

For example, the following command line call to MassMine:

    massmine --task=twitter-search --count=200 --query=love --output=mydata.json

can be called via a configuration file as

    massmine --config=my_config.txt

Assuming you first create a file called `my_config.txt` with the following lines:

    task = twitter-search
	count = 200
	query = love
	output = mydata.json

# Working With The Resulting Data

MassMine returns data from all sources as JSON. Depending on your analysis workflow, it can be more desirable to work in a column-oriented data format (such as csv format), such as when importing data into R, SPSS, Excel, or similar. A [companion tool has been created called jsan](https://github.com/n3mo/jsan) (The **J**SON **S**wiss **A**rmy k**N**ife) that provides quick and memory-efficient conversion into column-oriented data formats.

`jsan` can be used after data has been collected. For example:

    # Fetch some data first
    massmine --task=twitter-search --count=200 --query=love --output=mydata.json

    # Convert the JSON from above into .csv, keeping the
    # "text" and "user:screen_name" fields
	jsan --input=mydata.json --output=mydata.csv --keep text user:screen_name

For large data sets, such as when pulling data from the twitter-stream task, it can be advantageous to utilize the streaming capabilities of `massmine` and `jsan` to allow conversion while data is being collected:

    # Big request, piped into jsan using tee to create a .json file AND a .csv
    # copy of the desired fields. This saves the headache of converting a huge
    # file later
	massmine --task=twitter-stream --query=love --count=2000000 | tee mydata.json | jsan --output=mydata.csv --keep text user:screen_name
