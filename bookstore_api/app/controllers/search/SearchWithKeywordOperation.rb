require File.dirname(__FILE__) + '/SearchOperation'

class SearchWithKeywordOperation < SearchOperation
  def initialize(page, limit, keyword)
    super(page, limit)
    @keyword = keyword
  end

  def search
    super
    @books = Book.order(title: :desc)
                 .page(@page)
                 .limit(@limit)
                 .search_book(@keyword)

    @total = Book.search_book(@keyword).count
  end

  def results
    super
    @books
  end

  def total
    super
    @total
  end
end
