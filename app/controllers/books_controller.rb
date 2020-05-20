class BooksController < ApplicationController

 


  get "/books" do 
 
    if logged_in? == true
    # Render Books Index - List all Books
      erb  :'/books/index'
    else 
      redirect "/"
    end 

  end 


  #SHOW book
  get "/books/:id" do

    if logged_in? == true
    # Finds Book and saves the instance variable
    @book = Book.find_by(id: params[:id]) 
    # Renders book show page
    erb :'/books/show'
    else 
      redirect "/"
    end 
    
  end

end
