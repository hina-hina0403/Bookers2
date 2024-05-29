class BooksController < ApplicationController
  def index
    @books = Book.all
    @book = Book.new
    @user = current_user
  end

  def create
    book = Book.new(book_params)
    book.user = current_user
    book.save!
    redirect_to book_path(book.id)
  end

  def show
    @book = Book.find(params[:id])
    @user = @book.user
  end

  def edit
    @book = Book.find(params[:id])
  end
  
  # def destroy
  #   post_image = PostImage.find(params[:id])
  #   post_image.destroy
  #   redirect_to '/post_images'
  # end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
end
