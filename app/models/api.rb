require 'sinatra'

class API 
  
    def self.fetch
      key = "AIzaSyCw2Nr83ILWmquvGGcoRv54X6WC8_T7TvQ"
      user_id = "102103697493468167545"
      url = "https://www.googleapis.com/books/v1/users/#{user_id}/bookshelves/2/volumes?key=#{key}&maxResults=50"
      return response = HTTParty.get(url)

    end
  
    
  end