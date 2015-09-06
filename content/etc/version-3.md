+++
Categories = ["Etc"]
CoverImage = "images/etc/version-3/cover.png"
Tags = ["Babel", "Disqus", "CSS3", "ES6", "Eva", "GitHub", "Gulp", "jQuery", "Handlebars", "Hugo", "Markdown", "PrismJS", "RSS", "SASS", "Version 3", "XHTML"]
date = "2015-09-05T18:43:34-07:00"
Title = "Version 3"
SubTitle = "Refined. Polished."
+++

Rebuilt from the ground up, the new site is refined from the presentation to the
source. The theme has been modernized to load faster and I created more ways to
navigate the site so more data is easily accessible while keeping the idea of
simplicity in mind.

However, the site is more than just a pretty face. As a DIY’er, I take pleasure
in building something from the ground up. The previous versions were powered by
Wordpress. It’s amongst the most popular blogging technologies but honestly
maintaining it is a nightmare.

There are also more goals in mind with the new site that will encourage more
postings and in effect be the personality.

I hope you enjoy what’s to come.

## Technologies

The site is no longer powered by a backend technology that has to be coupled
with a database. This made issues when trying to upgrade and keep up to date.
Now we’re a fully statically generated site. This has a lot of benefits such as
less server maintenance (virtually none) and much faster load times from the
user experience.

### Hugo

This is the a new player to the top static site generators out there today. I
initially tried porting over my site from Wordpress with Jekyll. It wasn’t as
straight forward as I thought it would be. There were a few bumps on the road
were taking away from my fire.

I ended up choosing Hugo because it was easy to get an example site up and
running very quick. It doesn’t have all the bells and whistles that Jekyll might
but I realized that I didn’t need them. There is also something to be said about
Hugo’s speed. It’s a big deal when creating a new page because the generator has
to rebuild just about every page. Being written in Go was a great idea.

A few things that I thought were really nice out of the box was the web server,
sitemap generator, and RSS support. Not to mention the whole application is a
single binary app.

### XHTML

This is mainly a matter of preference. It bothers me that you don’t have to
close certain tags in HTML which is why I prefer XHTML. I like to keep some sort
of sanity.

I cringe every time I think of how browsers must parse standard HTML. I think of
the days when I was a fresh programmer at my first job and tasked with data
mining from websites using PHP. Oh, we just went to a dark place didn’t we?

### SASS + SUSY + CSS3

This goes back to my DIY nature. I don’t like using pre-built frameworks like
Twitter’ Bootstrap because it seems to be a lot of overkill for doing a few
simple things. Sometimes you have to use so many CSS classes to achieve
something and it feels dirty, similar to writing inline styles. I like running
lean and mean, that’s always been my motto.

### ES6 + Babel

Let’s face it, JavaScript sucks. We all know it. A lot of the time it doesn’t
make sense which is probably why it’s so closely related to HTML. Nonetheless
it’s a necessary evil. ES6 sucks a lot less by letting you regain some amount of
sanity. Using Babel I can future proof my code and start using the technologies
of tomorrow, today.

### jQuery

Meh. Not much to say about jQuery. Let’s just move on.

### Handlebars

This is a fantastic client side library for building templates. I’m a huge fan.
Not currently using it at the moment of this writing but it’s baked into the JS
application ready to go. It will be used in future plans.

### PrismJS

The source code viewer you see throughout the site is using PrismJS. I have to
give it two thumbs up. One for following standards and another for looking
awesome. I just wish they had a better way of building custom packages. Oh well,
beggars can’t be choosers.

## Services

Now that this is a 100% static site, I need a few services to help with features
needing a backend.

### GitHub

GitHub just get’s it. Get it? Thanks to their static website hosting I don’t
have to pay a dime or manage a server anymore. Instead I just create a repo and
run my website off a branch. Having your SCM and website coupled together like
this is very pleasant and makes for a simple deploy process.

Oh, and did I mention this site is now completely open source?

### Mailchimp

Please signup to the newsletter if you want to stay up to date. I’m planning on
doing only one newsletter a month if there is a decent amount of subscriptions.

## Dedicated to my daughter

This site is dedicated to my daughter, Eva. May all your dreams come true.

<img src="/images/etc/version-3/eva-misfit.jpeg" class="center" />

[rsb]: https://github.com/richardsumilang-blog "Richard Sumilang's Blog on GitHub"
