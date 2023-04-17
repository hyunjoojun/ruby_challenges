class CircularBuffer
  def initialize(max_size)
    @buffer = []
    @max_size = max_size
  end

  def read
    @buffer.empty? ? raise(BufferEmptyException) : @buffer.shift
  end

  def write(ele)
    return unless ele
    full? ? raise(BufferFullException) : @buffer << ele
  end

  def write!(ele)
    return unless ele
    @buffer.shift if full?
    @buffer << ele
  end

  def clear
    @buffer = []
  end

  private

  def full?
    @buffer.size == @max_size
  end

  class BufferEmptyException < StandardError; end
  class BufferFullException < StandardError; end
end
