class BookCategoriesController < ApplicationController
  before_action :set_book_category, only: [:show, :update, :destroy]

  # GET /book_categories
  def index
    @book_categories = BookCategory.all
    render json: @book_categories
  end

  # GET /book_categories/1
  def show
    render json: @book_category
  end

  # POST /book_categories
  def create
    @book_category = BookCategory.new(book_category_params)

    if @book_category.save
      render json: @book_category, status: :created, location: @book_category
    else
      render json: @book_category.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /book_categories/1
  def update
    if @book_category.update(book_category_params)
      render json: @book_category
    else
      render json: @book_category.errors, status: :unprocessable_entity
    end
  end

  # DELETE /book_categories/1
  def destroy
    @book_category.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book_category
      @book_category = BookCategory.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def book_category_params
      params.require(:book_category).permit(:name)
    end
end
