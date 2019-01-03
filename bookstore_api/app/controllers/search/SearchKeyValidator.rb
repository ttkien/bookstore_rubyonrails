class SearchKeyValidator
  def initialize(min_length, max_length)
    @min_length = min_length
    @max_length = max_length
  end

  def validate(key)
    length = key.length
    @min_length <= length && length <= @max_length
  end
end