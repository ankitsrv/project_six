require 'rss'
require 'open-uri'
namespace :sync do
  task feeds: :environment do
    feeds = Feed.all
    feeds.each do |feed|
      url = feed.url
      open(url) do |rss|
        content = RSS::Parser.parse(rss, false)

        content.items.each do |item|
          # debugger
          local_entry = feed.entries.where(title: item.title).first_or_initialize
          local_entry.update_attributes(content: item.description, author: item.author, url: item.link, published: item.pubDate)

          puts "Item: #{item.title}"
        end
      end
    end
  end
end


#---------------------------------------------

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
# rss = RSS::Parser.parse('http://www.michaelrigart.be/en/blog.rss', false)
# rss.items.each do |item|
#   puts "#{item.pubDate} - #{item.title}"
# end