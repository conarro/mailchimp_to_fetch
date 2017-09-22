require 'bundler'
Bundler.require
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each {|file| require file }

use Rack::Auth::Basic, "Restricted Area" do |username, password|
  username == ENV['APP_USERNAME'] and password == ENV['APP_PASSWORD']
end

post '/' do
  event = MailchimpEvent.new(params)

  if event.subscribe?
    # send to Fetch
    FetchApiClient.find(event.email)
  else
    puts "Unsupported Mailchimp webhook event #{event.inspect}"
    halt 400
  end
end

get '/health' do
  content_type :json
  {status: 'OK'}.to_json
end

# mailchimp will ping this when creating the webhook
# so it needs to return success
#
get '/' do
end
