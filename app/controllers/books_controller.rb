class BooksController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @books = Book.all

    render json: BooksRepresenter.new(@books).as_json
  end

  def create
    @book = Book.new(book_params)

    if @book.save
      render json: @book, status: :created
    else
      render json: @book.errors, status: :unprocessable_entity
    end
  end
  
  def destroy
    Book.find(params[:id]).destroy!

    head :no_content
  end

  private

  def book_params
    params.require(:book).permit(:title, :author)
  end
end
