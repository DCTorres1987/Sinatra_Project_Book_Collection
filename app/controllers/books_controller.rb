class BooksController < ApplicationController

 
  # CREATE all books

  get "/books" do 
    erb  :'/books/index'
  end 


  #SHOW book
  get "/books/:id" do
    @book = Book.find_by(id: params[:id])

    erb :'/books/show'
  end

end
