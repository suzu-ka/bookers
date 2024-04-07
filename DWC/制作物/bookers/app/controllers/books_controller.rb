class BooksController < ApplicationController
  def index
    @books = Book.all
    @book = Book.new
  end

  def create
    @books = Book.all
    @book = Book.new(book_params)
    if @book.save
      redirect_to book_path(@book.id) #showにリダイレクト
    else
      render :index
    end
    flash[:notice] = "Book was successfully created."
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to book_path(@book.id) #showにリダイレクト
    else
      render :edit
    end
    flash[:notice] = "Book was successfully updated."
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to '/books' #indexにリダイレクト
    flash[:notice] = "Book was successfully destroyed."
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end