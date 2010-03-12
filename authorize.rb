require 'twitter_oauth'
client = TwitterOAuth::Client.new(
    :consumer_key => 'o6goj5BuR9Jv9FYTwEkng',
    :consumer_secret => 'kMHC2AocrhJk5TXomlY3zFaXsFb7nQ0VdRBxnkvfogE'
)
request_token = client.request_token()
puts "Go here and authorize me #{request_token.authorize_url}"
puts "Enter pin:"
pin = gets 

access_token = client.authorize(
  request_token.token,
  request_token.secret,
  :oauth_verifier => pin.chomp
)

puts access_token.token
puts access_token.secret
