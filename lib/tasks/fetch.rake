require 'rss'
require 'open-uri'
namespace :fetch do
  task feeds: :environment do
    feeds = Feed.all
    feeds.each do |feed|
      url = feed.url
      open(url) do |rss|
        content = RSS::Parser.parse(rss, false)

        content.items.each do |item|
          local_entry = feed.entries.where(title: item.title).first_or_initialize
          local_entry.update_attributes(content: item.description, author: item.author, url: item.link, published: item.pubDate)

          puts "Item: #{item.title}"
        end
      end
    end
  end
end
