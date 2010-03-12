require 'twitter'

if ARGV[0].blank?
 puts "usage: tweetsearch.rb <search query>"
else
 tweets = Twitter::Search.new(ARGV[0]) 

 while(1)
  if tweets.entries.size > 0
   lastid = tweets.entries[0].id
   tweets.entries.reverse.each do |tweet|
    puts "#{Time.parse(tweet.created_at).strftime('%H%M%S')} #{tweet.from_user}: #{tweet.text}"
   end 
  end

  begin 
   sleep(5)
   tweets = Twitter::Search.new(ARGV[0]).since(lastid)
  end while(tweets.nil?)

 end
end



