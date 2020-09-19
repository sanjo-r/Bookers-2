class BooksController < ApplicationController
  def about
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to book_path
  end

  def index
    @books = Book.all
    @book = Book.new
    @user = current_user
  end

  def users_index
    @books = Book.all
    @book = Book.new
    @users = User.all
    @user = User.find(params[:id])
  end

  def show
    @book = Book.find(params[:id])
    @user = User.find(params[:id])
    # @books = @user.books
  end

  def edit

  end

  def destroy
    # book = Book.find(params[:id])
    Book.find_by(id: params[:id], book_id: params[:book_id]).destroy
    redirect_to books_path
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
