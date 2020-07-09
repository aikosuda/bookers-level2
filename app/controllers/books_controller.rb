class BooksController < ApplicationController

	def index
		@book = Book.new
  		@user = User.find(current_user.id)
  		@books = Book.all
	end

	def create
		@book = Book.new(book_params)
		@book.user_id = current_user.id
  		@book.save
  		redirect_to book_path(current_user.id)
	end

	def show
		@book = Book.new
		@books = Book.find(params[:id])
		@user = @books.user

	end

	def edit
		@book.find(params[:id])
	end

	def update
		@book.find(params[:id])
		@book.update(book_params)
		redirect_to book_path(params[:id])
	end

	def destroy
		@books = Book.find(params[:id])
		@books.destroy
		redirect_to books_path
	end

	private
  def book_params
  	params.require(:book).permit(:title, :body)
  end


end
