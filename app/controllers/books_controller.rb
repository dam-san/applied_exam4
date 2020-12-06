class BooksController < ApplicationController

  def new
  end

  def show
    @book = Book.find(params[:id])
    @book_comment = BookComment.new
    @book_comments = BookComment.all
    # binding.pry
  end

  def index
    @books = Book.all
    @book_new = Book.new
    # @book = Book.find(params[:id])
    # binding.pry
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    # binding.pry
    if @book.save
      # binding.pry
      redirect_to book_path(@book.id), notice: "You have created book successfully."
    else

      @books = Book.all
      render 'index'
    end
  end

  def edit
    @book = Book.find(params[:id])
    if @book.user_id!=current_user.id
      redirect_to books_path
    end
  end



  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      # binding.pry
      redirect_to book_path(@book), notice: "You have updated book successfully."
    else
      render "edit"
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    # binding.pry
    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end

end
