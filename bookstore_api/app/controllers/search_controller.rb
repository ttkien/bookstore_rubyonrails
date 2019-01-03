require_relative './search/SearchAllOperation.rb'
require_relative './search/SearchKeyValidator.rb'
require_relative './search/SearchWithKeywordOperation.rb'

class SearchController < ApplicationController
  # GET /books
  MIN_LENGTH = 3
  MAX_LENGTH = 100

  def index
    key = params[:key]
    if key.blank?
      search_operation = SearchAllOperation.new(page, limit)
    elsif search_key_validator.validate(key) == false

      render json: {
        status: 'error',
        code: 400,
        message: "key length must be greater than #{MIN_LENGTH} and" \
        " less than #{MAX_LENGTH}"
      }
      return
    else
      search_operation = SearchWithKeywordOperation.new(page, limit, key)
    end

    search_operation.search
    render json: {
      current_page: page,
      page_size: limit,
      total_items: search_operation.total,
      keyword: key,
      data: search_operation.results.includes(:book_category)
    }
  end

  def page
    params[:page] || 1
  end

  def limit
    params[:limit] || 10
  end

  def search_key_validator
    @search_key_validator ||= SearchKeyValidator.new(MIN_LENGTH, MAX_LENGTH)
  end

  def destroy
    @searchKeyValidator.destroy
  end
end
