class BooksController < ApplicationController
  # GET /books
  # GET /books.json
  def index
    #@books = Book.all
    @books = Book.where(:book_genre => params[:book_genre])
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @books }
    end  
   # render "show_by_book_genre" 
  end


  def show_by_book_genre
    @books = Book.where(:book_genre => params[:book_genre])
      
     # @books = Book.find_all(params[:book_genre])
   # @books = Book.where("book_genre => ?", 'mystery')
    # @book = Book.pluck(:book_genre)
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @books }
    end  
  end
  
  # GET /books/1
  # GET /books/1.json
  def show
  #  Client.where("created_at >= :start_date AND created_at <= :end_date",
  #{:start_date => params[:start_date], :end_date => params[:end_date]})

    @book = Book.find(params[:id])
    # @book = Book.where(:book_genre => params[:book_genre] )
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @book }
    end
  end
  
  # GET /books/new
  # GET /books/new.json
  def new
    if current_user 
      @book = Book.new
      respond_to do |format|
        format.html # new.html.erb
        format.json { render json: @book }
      end
    else
      #  flash.now[:error] = "Please Sign Up or Login!"

      redirect_to books_path(:book_genre => params[:book_genre]) ,:notice => "Please Sign Up or Login!"
    end 
  end
  
  # GET /books/1/edit
  def edit
  #  @temp=@book
  #  if current_user && current_user == @user 
  #    @book = Book.where(:book_genre => params[:book_genre] )
   # else
   #   redirect_to book_path(@temp), :notice => 'You Can only Edit your Posts!!'
   # end
    
    if current_user 
      @book = Book.find(params[:id])
    else
      redirect_to book_path(@books), :notice => 'You Can only Edit your Posts!!'
    end
    
  end
  
  # POST /books
  # POST /books.json
  def create
    @book = Book.new(params[:book])
    
    respond_to do |format|
      if @book.save
        format.html { redirect_to @book, notice: 'Book was successfully created.' }
        format.json { render json: @book, status: :created, location: @book }
      else
        format.html { render action: "new" }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end
  
  # PUT /books/1
  # PUT /books/1.json
  def update
    @book = Book.find(params[:id])
    
    respond_to do |format|
      if @book.update_attributes(params[:book])
        format.html { redirect_to @book, notice: 'Book was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end
  
  # DELETE /books/1
  # DELETE /books/1.json
  def destroy
    if current_user 
      @book = Book.find(params[:id])
      @book.destroy
      
      respond_to do |format|
        format.html { redirect_to books_url }
        format.json { head :no_content }
      end
    else
      redirect_to book_path, :notice => 'You Can only Delete your Posts!!' 
    end
  end
end  