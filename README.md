
# Tests, Tests, Tests

Feeds (in Atom, RSS, JSON Feed, HTML h-entry, etc.) with Test Assertions.


## Usage

How does it work?

Use the triple-dash (e.g. `---`) on its own line to separate
the feed source from all test assertions. Example:


```
{
  "version": "https://jsonfeed.org/version/1",
  "title": "JSON Feed",
  "description": "JSON Feed is a pragmatic syndication format for blogs, microblogs, and other time-based content.",
  "home_page_url": "https://jsonfeed.org/",
  "feed_url": "https://jsonfeed.org/feed.json",
  "user_comment": "This feed allows you to read the posts...",
  "favicon": "https://jsonfeed.org/graphics/icon.png",
  "author": {
    "name": "Brent Simmons and Manton Reece"
  },
  "items": [
    {
      "id": "https://jsonfeed.org/2017/05/17/announcing_json_feed",
      "url": "https://jsonfeed.org/2017/05/17/announcing_json_feed",
      "title": "Announcing JSON Feed",
      "content_html": "<p>We — Manton Reece and Brent Simmons — have noticed that JSON has become the developers’ choice for APIs,...",
      "date_published": "2017-05-17T08:02:12-07:00"
    }
  ]
}

---

feed.format:     json
feed.title:      JSON Feed
feed.url:        https://jsonfeed.org/
feed.feed_url:   https://jsonfeed.org/feed.json
feed.summary:    JSON Feed is a pragmatic syndication format for blogs, microblogs, and other time-based content.

feed.authors[0].name: Brent Simmons and Manton Reece

feed.items[0].title:     Announcing JSON Feed
feed.items[0].url:       https://jsonfeed.org/2017/05/17/announcing_json_feed
feed.items[0].id:        https://jsonfeed.org/2017/05/17/announcing_json_feed
feed.items[0].published_local: >>> DateTime.new( 2017, 5, 17, 8, 2, 12, '-7' )
feed.items[0].published:       >>> DateTime.new( 2017, 5, 17, 8, 2, 12, '-7' ).utc
```
