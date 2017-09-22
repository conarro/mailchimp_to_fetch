require 'httparty'

class FetchApiClient
  include HTTParty

  base_uri "https://fetch.amplemarket.com/v1/#{ENV['FETCH_API_KEY']}"

  def self.find(email)
    self.get('/people/find', query: { email: email })    
  end
end
