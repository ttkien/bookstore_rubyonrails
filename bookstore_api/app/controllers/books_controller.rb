class BooksController < ApplicationController
  before_action :set_book, only: [:show, :update, :destroy, :search]

  # GET /books
  def index
    @books = Book.where(book_category_id: params[:book_category_id])
    render json: @books
  end

   # GET /books
   def search

    @books = Book.search_any_word(params[:key])
    render json: @books
  end

  # GET /books/1
  def show
    render json: @book
  end

  # POST /books
  def create
    @book = Book.new(book_params)
    
    category_id =  book_params[:book_category_id]

    category = BookCategory.find_by(id: category_id)

    @book.book_category = category

    if @book.save
      render json: @book, status: :created, location: @book
    else
      render json: @book.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /books/1
  def update
    if @book.update(book_params)
      render json: @book
    else
      render json: @book.errors, status: :unprocessable_entity
    end
  end

  # DELETE /books/1
  def destroy
    @book.destroy
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_book
    @book ||= Book.find_by(id: params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def book_params
    params.require(:book).permit(:title, :description, :published_date, :cover_url, :book_category_id)
  end
end
