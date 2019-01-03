class SearchOperation
  attr_reader :page
  attr_reader :limit

  def initialize(page, limit)
    @page = page
    @limit = limit
    @is_executed = false
  end

  def search
    @is_executed = true
  end

  def checkSearchMethodNotExecuted
    raise SearchMethodNotExecuted if @is_executed == false
  end

  def total
    checkSearchMethodNotExecuted
    0
  end

  def results
    checkSearchMethodNotExecuted
    []
  end
end