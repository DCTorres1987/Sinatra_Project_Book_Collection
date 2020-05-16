class ReviewsController < ApplicationController

  #New review
  get "/books/:id/review" do
      @book = Book.find_by(id: params[:id])
      @user = current_user
 
      if  @book.reviews.find_by(user_id: @user.id) == nil
        erb :'review/new'
      else
        redirect to "/books/#{params[:id]}/review/show" 
      end 

  end

  #Create a review
  post "/books/:id/review" do 
         
    @user = current_user
    Review.create(:book_id => params[:id], user_id: @user.id, :stars => params[:rating], :comment => params[:commenttext])

    redirect to "/books/#{params[:id]}/review/show" 

  end

  #Shows the users review
  get "/books/:id/review/show" do 
    @user = current_user
    @book = Book.find_by(id: params[:id])
    @user_review = @book.reviews.find_by(book_id: params[:id],user_id: @user.id)
    erb :'review/show'
  end

  #index shows ALL the reviews of a given book
  # @book_review = @book.reviews
  get "/books/:id/review/index" do 
    @reviews = Review.all.select{|r| r.book_id == params[:id].to_i}
  
    erb :'review/index'
  end

  #EDIT review
  get '/books/:book_id/review/:review_id/edit' do

    @review = Review.find_by(id: params[:review_id])
    erb :'review/edit'
  end

  #UPDATE review
  patch '/books/:book_id/review/:review_id' do 

    @review = Review.find_by(id: params[:review_id])
    @review.update(:stars => params[:rating], :comment => params[:commenttext])
    redirect to "/books/#{@review.book.id}/review/show"
  end

  delete '/books/:book_id/review/:review_id' do 
 
    @user = current_user
    @my_review = Review.find_by(id: params[:review_id], user_id: @user.id)
    @my_review.destroy
    redirect to "/books/#{params[:book_id]}"
  end 

end