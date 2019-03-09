+++
Categories = ["Servers"]
Tags = ["Asana", "Bitbucket", "Git", "GitHub"]
date = "2015-01-31T00:58:00-08:00"
title = "How to reference Bitbucket commits to Asana"
disqusIdentifier = "477 http://www.richardsumilang.com/blog/?p=477"
aliases = ["/blog/2015/01/31/how-to-link-bitbucket-to-asana"]

+++

[1]: https://github.com/rsumilang/asana-post-commit "Asana Post Commit"
[2]: https://github.com/Spaceman-Labs/asana-post-commit "Asana Post Commit"
[3]: https://asana.com/apps/github "Asana GitHub App"
[4]: https://app.asana.com/-/account_api "Asana Account API"

**tl;dr:** Use [this][1] **post-commit** hook.

<!--more-->

I found [this great][2] git **post-commit** hook by Spaceman Labs. It works by
adding a comment to your Asana ticket when you reference your commit message by
id. For example, **"Fixing issue #12345."** This adds a comment to your ticket:

<pre>Just committed %commit-id with message:

"Fixing issue #1234"

to repository %repo-name</pre>

This works by making a curl request to Asana's REST API on your behalf while
sending the above message as the comment. While this is great, it could be
better by providing links to your Bitbucket changeset. I've made the necessary
edits to do so in the **post-commit** hook. The updated message now looks like
this:

<pre>Committed %link-to-commit with message:

"Fixing issue #1234"

to repository %repo-name</pre>

### How it works

I loop through all the remote repositories configured for the repo and search
for either a bitbucket.org or github.com in their URLs. Once  one is found, I
extract the repo name from the URL and build the link to the changeset.

**Note:** If you are using Github then I recommend  using the free
[Asana service][3] provided. I merely included the GitHub code as an example.

The original code from here takes over and parses out the ticket number and does
the curl request.

### Installation

Grab my edited **post-commit** hook from [github][1] and drop it into your repos
`.git/hooks` directory. Make sure to `chmod` the file to `0755`. Lastly, grab
your [Asana key][4] and run `git config --global user.asana-key
"MY_ASANA_API_KEY"`.

### Afterthoughts

Please let me know if you have any suggestions. I'm thinking of possibly editing
the git commit message to link back to the Asana ticket for the sake of
cross-linking but this might require additional configuration... Unless project
id is added as part of the ticket number. Ie: #12345/98765. Please feel free to
add your input! :)
