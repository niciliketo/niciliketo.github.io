---
title: "2021 02 27 New Rails App"
date: 2021-02-27T17:21:37Z
draft: true
---

# New Rails App

For fun, I am creating a new rails app.

Its going to be fairly simple and call out to teh Open AI API I recently got access too.

I do want to use this as a chance to try some new tooling.
- SSO
- New CSS frameworks
- Hotwired

## SSO
Logging in is tedious, and everyone has lots of accounts. We can use OAuth2 to simplfy this for users.
For my app I decided to use LinkedIn. Not really sure if this is the best decision, but as its for businesss it seems sensible.

## New CSS frameworks

### TailwindCSS
I did a bit of Googling and decided to try [TailWind](https://tailwindcss.com/)

I found a [tutorial on getting it running with Rails](https://davidteren.medium.com/tailwindcss-2-0-with-rails-6-1-postcss-8-0-9645e235892d) but decided to ignore the part I didnt understand. After an hour or two of failing to get it working I decided to try that part (switch to a specific version of webpacker). Suprise suprise that made it work!

### webpacker
Nowadays there is a lot of JavaScript around. In Rails we can make better use of this with WebPacker instead of the old Sprockets asset pipeline.
This leans on js tooling instead of sprockets and gives a lot of options.
The packages can be managed with yarn which sees like a good idea.

### how it works
I am not quite sure if this is standard, but after adding a `stylesheet_pack_tag` in my application.html.erb I was expecting to see some CSS. However, what actually happens is your application.js gets a load of css included in it. Pretty confusing. I am keeping the stylesheet tag for now, as I think it might work different in production.

### Adding styling
Took a while to get to the point where I could actually do some styling, so I decided to just spend 30 mins on it...
