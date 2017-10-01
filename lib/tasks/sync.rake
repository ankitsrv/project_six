# namespace :sync do
#   task feeds: [:environment] do
#     Feed.all.each do |feed|
#       content = Feedjira::Feed.fetch_and_parse feed.url
#       content.entries.each do |entry|
#         local_entry = feed.entries.where(title: entry.title).first_or_initialize
#         local_entry.update_attributes(content: entry.content, author: entry.author, url: entry.url, published: entry.published)
#         p "Synced Entry - #{entry.title}"
#       end
#       p "Synced Feed - #{feed.name}"
#     end
#   end
# end
#
# require 'rss'
# require 'open-uri'
#
# url = 'http://www.ruby-lang.org/en/feeds/news.rss'
# open(url) do |rss|
#   feed = RSS::Parser.parse(rss)
#   puts "Title: #{feed.channel.title}"
#   feed.items.each do |item|
#     puts "Item: #{item.title}"
#   end
# end
#
# rss = RSS::Parser.parse('http://www.michaelrigart.be/en/blog.rss', false)
# rss.items.each do |item|
#   puts "#{item.pubDate} - #{item.title}"
# end