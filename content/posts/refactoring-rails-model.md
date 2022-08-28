---
title: "Refactoring Rails Model"
date: 2021-10-26T07:41:54Z
tags: ["diary", "rails"]
featured_image: "images/2021/cat-yawn.jpg"
description: "Real-world Rails model refactoring"
draft: true
---
A recent change<sup>*</sup> highlighted that one of our ActiveModel classes contained almost 1600 lines of code and methods with almost 100 lines. The `Lot` model is responsible for an item or set of items linked to an `Event`.

This gave me a chance to research how to refactor an Active Record model. [Refactoring, Ruby Edition](https://martinfowler.com/books/refactoringRubyEd.html) is a great place to start, and contains some useful general priciples, however it does have specific techniques to apply for Rails Models.  Code Climate have published practical examples [7 Patterns to Refactor Fat ActiveRecord Models](https://codeclimate.com/blog/7-ways-to-decompose-fat-activerecord-models/)

The patterns are -
1. Extract Value Objects
2. Extract Service Objects
3. Extract Form Objects
4. Extract Query Objects
5. Introduce View Objects
6. Extract Policy Objects
7. Extract Decorators

Great! So, I decided to start with a set of methods which certain metrics related to the Lot. Unfortunately, this doesn't fit well with any of the patterns described above.

I did want to start experimenting, so I chose to try extracting them to a class called `LotStatistics`. I am not sure this will be the final destination, but it will allow me to experiment. I put the new class inside.
```ruby
# app/models/lot/lot_statistics.rb
class Lot::LotStatistics
  extend Memoist
  attr_accessor :lot

  def initialize(lot)
    @lot = lot
    @event = lot.event
  end
```
I also added a method to my `Lot` model to reference the statistics.
```ruby
  def statistics
    @statistics ||= LotStatistics.new(self)
  end
```

---
## List of References ##
[Refactoring, Ruby Edition](https://martinfowler.com/books/refactoringRubyEd.html)\
[7 Patterns to Refactor Fat ActiveRecord Models](https://codeclimate.com/blog/7-ways-to-decompose-fat-activerecord-models/)\
[HN Discussion](https://news.ycombinator.com/item?id=4664191)
[Where to put code](https://codeclimate.com/blog/what-code-goes-in-the-lib-directory/)

<sup>*</sup>
Over the past few years we have introduced a number of tools into our CI Pipeline to help us write better code. These are [Rubocop](https://github.com/rubocop/rubocop), [Reek](https://github.com/troessner/reek) and [Code Climate](https://codeclimate.com/). Our existing code base has lots of things these tools don't like, so we only failing builds for twe can incrementally improve code as we touch it.

This has worked _reasonably_ well, although sometimes an apparently small change can take longer due to needing to unexpectedly refactor.Upgrading Rails from 6.0.3.7 to 6.0.4.1. This is a minor version change to address a security fix. However, it also includes a change to how negative amounts are converted to currencies, which unfortunately broke our approach for nil values (£-).