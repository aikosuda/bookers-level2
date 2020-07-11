class BooksController < ApplicationController

	before_action :authenticate_user!
	before_action :correct_user,   only: [:edit, :update]


	def index
		@book = Book.new
  		@user = User.find(current_user.id)
  		@books = Book.all
	end

	def create
		@user = User.find(current_user.id)
  		@books = Book.all
		@book = Book.new(book_params)
		@book.user_id = current_user.id
  		if @book.save
  			flash[:create] = "You have creatad book successfully."
  			redirect_to book_path(@book)
  		else
  			render :index
  		end
	end

	def show
		@book = Book.new
		@books = Book.find(params[:id])
		@user = @books.user

	end

	def edit
		@books = Book.find(params[:id])

	end

	def update
		@books = Book.find(params[:id])
		if  @books.update(book_params)
			flash[:update] = "You have updated book successfully."
			redirect_to book_path(@books)
		else
			render :edit
		end
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

    def correct_user
    book = Book.find(params[:id])
    if current_user.id !=  book.user.id
      redirect_to books_path
    end
    end




end
