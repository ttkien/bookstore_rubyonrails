
class SearchMethodNotExecuted < RuntimeError
end

class SearchAllOperation < SearchOperation
  def initialize(page, limit)
    super
  end

  def search
    super
    @books = Book.all.order(title: :desc)
                 .page(@page)
                 .limit(@limit)
    @total = Book.count
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
