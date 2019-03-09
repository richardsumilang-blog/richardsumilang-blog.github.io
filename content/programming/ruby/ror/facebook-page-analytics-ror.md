---
CoverImage: images/programming/ruby/ror/facebook-page-analytics-ror/facebook-page-analytics-ror-cover-900x477.png
CoverImageType: image/png
CoverImageWidth: 900
CoverImageHeight: 477
Description: Ruby on Rails application that provides analytics for Facebook posts of a Facebook page. A user should be able to login using Facebook, authorize access for a specific page they administer, and see a display of that pages' top 5 posts as well as a sortable table of 100 most recent posts.
Categories:
 - Programming
Tags:
 - Facebook
 - Ruby
 - Ruby on Rails
 - Analytics
 - Open Graph
 - SQLite
Keywords:
 - Facebook
 - Ruby
 - Ruby on Rails
 - Analytics
 - Open Source
 - Open Graph
 - SQLite
 - Rails::API
Title: Facebook Page Analytics
SubTitle: with Ruby On Rails
Date: "2015-12-20T10:57:00-07:00"
---

[1]: https://github.com/rsumilang/fb-page-analytics-ror "Facebook Page Analytics with Ruby On Rails"
[2]: https://creativecommons.org/licenses/by/4.0/legalcode "Creative Commons License 4.0"
[3]: https://github.com/rsumilang/fb-page-analytics-ror/blob/master/README.rdoc "Facebook Page Analytics Readme.rdoc"
[4]: https://developers.facebook.com/docs/apps/register "Facebook Register and Configure an App"
[5]: https://github.com/mkdynamic/omniauth-facebook "OmniAuth Facebook"
[6]: https://github.com/arsduo/koala "Koala Gem"
[7]: https://daemons.rubyforge.org/ "Daemons Gem"
[8]: https://github.com/collectiveidea/delayed_job_active_record "DelayedJob ActiveRecord Backend"
[9]: https://github.com/ejschmitt/delayed_job_web "Delayed Job Web"
[10]: https://github.com/rails-api/rails-api "Rails::API"
[11]: https://github.com/rsumilang/chef-gearman "Chef-Gearman"

I decided to flex my programming muscle and try something new. I've done Ruby
for CLI tools and [Chef cookbooks][11] but never a Ruby on Rails (RoR)
application. Much of the hype with RoR is gone these days but it's been around
long enough to be considered tested and somewhat mature like an old elitist
hipster... If that makes sense.

**tldr;** [Just give me the source][1]


## Description

The project was to create a Rails applications that provides analytics for the
last 100 Facebook posts of a Facebook page. As a user, you should be able to
login using Facebook, see a list of pages that you have authorized admin access
to, and lastly see a display of the pages' top 5 posts (out of the last 100) as
well as a sortable table of the 100 most recent posts.

<!--more-->


### Requirements

- Store user and page Facebook credentials, basic Facebook profile data (name of
user, name of page, email address), and the last 100 posts in a database.
- Each entry in the post table should include:
 - Link to Posts (on Facebook)
 - Message/text body of post
 - Number of Shares
 - Number of Comments
 - Number of Likes
 - Number of Impressions
 - Date Posted
- Posts should be sortable by number of shares, likes, comments, and date posted.
- "Top 5 Posts" display can be chosen/ranked by any arbitrary combination of
post statistics. 


# The Application

A week long into RoR land and I'm happy to say it's done... Well, 98% of it is.
I was nice enough to leave a little of this project left for you to do (I
happily accept pull requests):

1. Retrieving the number of impressions for each post.

2. The app currently does not paginate to the end of all Facebook page posts. It
stops at of the first set of results. 

The [Facebook page analytics source][1] is freely made available under the 
[Creative Commons License v4][2].


## My System

- **Ruby:** ruby 2.2.1p85 (2015-02-26 revision 49769) [x86_64-darwin14]
- **Rails:** Rails 4.2.5


## Setup

The requirements to run the project will be kept updated in the
[README.rdoc][3] but shouldn't diverge too much from this:

1. Database setup (sqlite):
<pre><code class="language-bash" title="Database Setup">rake db:migrate</code></pre>

2. The Facebook configuration variables are externalized via environment
variables so you'll need to set these parameters:
<pre><code class="language-bash" title="Configuration">export FB_APP_ID=YOUR_FB_APP_ID
export FB_APP_SECRET=YOUR_FB_APP_SECRET</code></pre>
[Read this doc][4] if you're unfamiliar with created a Facebook App.

3. Two servers need to be started. The *app server* and *job server*:
<pre><code class="language-bash" title="Servers">rails s # app server
rake jobs:work # job server</code></pre>

### Urls

- **Application:** http://localhost:3000/
- **Job Web View:** http://localhost:3000/delayed_job/overview 

## Database

Please refer to the graphic:

![Facebook Analytics Database Graphic](/images/programming/ruby/ror/facebook-page-analytics-ror/db-layout-772x346.png)


## How it works

1. The application can be loaded on http://localhost:3000/. You will find a
fancy "Facebook" link in the header. Click the link and log in with the test
account.

2. Upon successful log in, the system grabs all the pages the user is an
administer of and does a few things:

 1. If the page does not exist in our db then we create it and create the
 relationship between the user and the page.
    
 2. If a user no longer has access to a specific page then the relationship
 between the two is removed but all page data is kept.

 3. The pages controller will either list all the pages a user is an admin of,
 allowing the user to choose OR redirect to the stats page of the single page
 they administer.

3. The stats page is then responsible for retrieving all posts. On first load,
the stats page will pull from the top of the feed all the way down. On every
subsequent request, the stats controller will pull only newer feed items.

 1. A background job is then created for each post. This background job is
 responsible for fetching the likes, comments, shares, and impressions for each
 post while updating the database. This background process was created so the
 wait on the stats page wasn't terribly long. Because of this, you will see the
 stats update on the page when you refresh.
 
 2. The stats page displays a top 5 list of the most popular posts. This is
 ordered by date, likes, and comments. Nothing too crazy.
 
 3. The stats page then lists all posts in a table below in a sortable fashion
 by clicking the header.

4. The sign out button will set session variables to `nil` causing an invalid
session and redirect the user to the home page.


## Gems Used

The following gems were used to build the project:

- **[omniauth-facebook][5]:** Used to handle authentication to Facebook.
- **[koala][6]:** Nifty for communicating with Facebook graph API.
- **[daemons][7]:** Experimented with this for fun. This would be used to run
the job server in production.
- **[delayed_job_active_record][8]:** - Used to schedule and run the background
jobs.
- **[delayed_job_web][9]:** Web interface for delayed job.


## Refactoring

There are a few things I know that can be done better off the top of my head if
this were a real world application. (I would also appreciate any feedback or
ruby-isms in the comments.)

1. Ideally the stats page should not be making the request to Facebook to pull
in the posts associate with the page they are on. It should be a background job
that fires up more workers to gather the metrics for each post.

2. The job worker only supports handling one post at a time. It's fine for the
sake example but in a real world situation we should be making batch requests.
This can easily be done by passing an array of Facebook `object_ids` to the
endpoint to eliminate multiple requests. The same could be said for the page
controller.

3. As the application grows, there will be more repetition the way things were
done. I can see use for breaking some of the `User` model up by removing the
sign up code and placing it into a concern and there can be good uses for
helpers.


## End Thoughts

**The Good:** I was fairly impressed with the amount of work I got done in a
short amount of time without having any Ruby friends to lean on. The syntactic
sugar provided by Ruby made certain things a pleasure to work with and gems seem
well thought out with a lot of care that the Ruby community is known for. My
personal favorite being the *delayed_job_active_record* in this project.

I was also impressed by how organized Rails is. The database migration feature
was really smooth and I thought it was neat how 3rd party gems made use of that
in your application.

**The Bad:** Sometimes there was too much syntactic sugar that actually did the
opposite of making code easier to read. One of my pet peeves was using hashes.
This was because the colon placement in symbols changes and sometimes there
isn't a clear distinction where a method parameter ends and starts without
having to look very closely. I found this annoying at times because it was also
hard for my IDE (IntelliJ) to tell me what was valid code. This is more of a
Ruby dislike than RoR, though.

On the Rails side, there was also too much magic. I get it, convention over
configuration but it bit me a few times with ActiveRecord. The code didn't error
when trying to use so it was kind of annoying to debug at times. Maybe there are
better ways to do it that I'm not aware of?

### Conclusion

Would I use RoR again? Yeah, probably. The learning curve was kind of high with
Rails but once you get in the groove of it then it's pretty powerful with the
amount of work you can accomplish in a short amount of time. For me, this would
be great for prototyping ideas. I'm a fan of the great gems I found and
[Rails::API][10] looks pretty neat.
