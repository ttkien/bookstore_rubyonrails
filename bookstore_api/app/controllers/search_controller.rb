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
    data = search_operation.results.includes(:book_category).load
    render json: {
      current_page: page.to_i,
      page_size: limit,
      total_items: search_operation.total,
      keyword: key,
      data: data,
      number_of_items: data.size,
      total_page: ((search_operation.total / limit) + 1).to_i
    }
  end

  def page
    page_number = params[:page].to_i
    if page_number.nil? || page_number.zero?
      return 1
    else
      return page_number
    end
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
