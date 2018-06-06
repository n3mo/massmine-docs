((title . "MassMine: Tumblr")
 (layouts "docs.sxml"))

# Tumblr
<div class="hint">To access Tumblr using MassMine you must first authenticate. This is a requirement of Tumblr. Authorization is simple, and only has to be completed once.</div>

To authenticate with Tumblr, run

    massmine --task=tumblr-auth

Check out the [general usage examples](/docs/config.html) to learn how to use MassMine. Below is a description of the tasks available for Tumblr.

Task parameters marked * are required. For parameters marked with a + choose only one.

## Tasks

<br></br>
<div class="task">tumblr-auth</div>

Sets up MassMine to make data requests under your Tumblr account privileges. This task *must* be ran before using any other Tumble tasks, or an error will be returned.

### Parameters

<none>

### Example

    massmine --task=tumblr-auth

<br></br><br></br>
<div class="task">tumblr-blog-info</div>

Retrieve meta data information about 1 or more blogs, including the number of posts, description, and more. 

### Parameters

- **query***: Blog name(s). Can be short format, full URL (including .tumblr.com), or a custom URL (see examples). Separate multiple blogs with commas.

### Example

	# You can specify Tumblr blogs in short format
    massmine --task=tumblr-blog-info --query=kingjamesprogramming

	# Fetch info on multiple blogs at once 
    massmine --task=tumblr-blog-info --query=kingjamesprogramming,famouspeopledrinkingtea

	# You can also specify full URLs
    massmine --task=tumblr-blog-info --query=kingjamesprogramming.tumblr.com

	# Tumblr blogs with custom URLs can also retrieved
    massmine --task=tumblr-blog-info --query=www.exampleblog.com

<br></br><br></br>
<div class="task">tumblr-posts</div>

Retrieve posts from 1 or more blogs. The raw text of each post is returned with meta data.

### Parameters

- **query***: Blog name(s). Can be short format, full URL (including .tumblr.com), or a custom URL (see examples). Separate multiple blogs with commas.
- **count***: Number of posts to return *from each requested blog in **query***.

### Example

	# You can specify Tumblr blogs in short format
    massmine --task=tumblr-posts --query=kingjamesprogramming --count=10

	# Fetch posts from multiple blogs at once. 
    massmine --task=tumblr-posts --query=kingjamesprogramming,famouspeopledrinkingtea --count=10

	# You can also specify full URLs
    massmine --task=tumblr-posts --query=kingjamesprogramming.tumblr.com --count=10

	# Tumblr blogs with custom URLs can also retrieved
    massmine --task=tumblr-posts --query=www.exampleblog.com --count=10

<br></br><br></br>
<div class="task">tumblr-tag</div>

Search for blog posts containing 1 or more tags. The raw text of each post is returned with meta data.

### Parameters

- **query***: Tag(s) to search for. Separate multiple tags with commas.
- **count***: Number of posts to return *for each requested tag in **query***.

### Example

	# This will return up to 20 posts including the tag "lol"
    massmine --task=tumblr-tag --query=lol --count=20

	# Search for multiple tags at once. This will return up to 40 posts
    massmine --task=tumblr-tag --query=lol,gif --count=20

