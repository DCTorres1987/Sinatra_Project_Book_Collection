class ReviewsController < ApplicationController

  #New review
  get "/books/:id/review" do
    # Finds Book instance and saves to instance variable
   

      @book = Book.find_by(id: params[:id])
    # Calls helper method and saves current user instance to instance variable
      @user = current_user
      
    # Checks to see if user has created a review for that book
    # If nil is returned review new form is rendered
      if  @book.reviews.find_by(user_id: @user.id) == nil
        erb :'review/new'
      else
    # If a review instance is returned that the user created
    # user gets redirected to the books review show page
        redirect to "/books/#{params[:id]}/review/show" 
      end 

  end

  #Create a review
  post "/books/:id/review" do 
    if logged_in? == true
      # Calls helper method and saves current user instance to instance variable       
        @user = current_user
      # Create a new review instance that includes user id
        Review.create(:book_id => params[:id], user_id: @user.id, :stars => params[:rating], :comment => params[:commenttext])
      # redirects user to review show page
        redirect to "/books/#{params[:id]}/review/show" 
    else 
      redirect "/"
    end 
  end

  #Shows the users review
  get "/books/:id/review/show" do 
    if logged_in? == true
      # Calls helper method and saves current user instance to instance variable 
        @user = current_user
      # Finds Book instance and saves to instance variable
        @book = Book.find_by(id: params[:id])
      # finds the user's review for that book and saves into instance variable
        @user_review = @book.reviews.find_by(book_id: params[:id],user_id: @user.id)
      # renders show page
        erb :'review/show'
    else 
      redirect "/"
    end 

  end

  #index shows ALL the reviews of a given book
  # @book_review = @book.reviews
  get "/books/:id/review/index" do 
    if logged_in? == true
      @reviews = Review.all.select{|r| r.book_id == params[:id].to_i}
    
      erb :'review/index'
    else 
      redirect "/"
    end 

  end

  #EDIT review
  get '/books/:book_id/review/:review_id/edit' do
    if logged_in? == true
      @review = Review.find_by(id: params[:review_id])
      erb :'review/edit'
    else 
      redirect "/"
    end 
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