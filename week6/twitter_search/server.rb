require 'sinatra'
require 'twitter'

client = Twitter::REST::Client.new do |config|
  config.consumer_key    = # <YOUR TWITTER CONSUMER KEY>
  config.consumer_secret = # <YOUR TWITTER CONSUMER SECRET>
  config.access_token    = # <YOUR TWITTER ACCESS TOKEN>
  config.access_token_secret = # <YOUR TWITTER ACCESS TOKEN SECRET>
end

get '/:search_query' do
	@search_query = params[:search_query]
	@tweets = client.search(@search_query).take(3)

	erb :tweet_list
end
