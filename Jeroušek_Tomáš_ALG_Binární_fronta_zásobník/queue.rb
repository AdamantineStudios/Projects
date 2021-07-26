require_relative "boolean_array"
require_relative "singly_linked_list"

class QueueEmptyException < Exception
  def initialize(queue)
    @queue = queue
  end

  def message
    "Queue is empty"
  end
end

class QueueFullException < Exception
  def initialize(queue)
    @queue = queue
  end

  def message
    "Queue is full"
  end
end

class SinglyListQueue
  def initialize
    @queue = SinglyLinkedList.new
  end

  def queue(x)
    # returns self
    @queue << x
    self
  end

  def dequeue
    # returns the removed value
    # raises QueueEmptyException if queue is empty
    if @queue.length == 0
      raise QueueEmptyException.new(self)
    end
    @queue.delete_at(0)
  end
end

class BooleanArrayQueue
  def initialize(size)
    @queue = BooleanArrayQueue.new(size)
    @start = 0
    @end = 0
    @size = size
    @actual_size = 0
  end

  def queue(x)
    # returns self
    # raises QueueFullException if queue is already full
    raise QueueFullException.new(self) if @queue.used_length == @queue.length
    @queue << x
  end

  def dequeue
    # returns the removed value
    # raises QueueEmptyException if queue is empty
    if @actual_size == 0
      raise QueueEmptyException.new(self)
    end
    return_value = @queue[@start]
    if @start + 1 == @size
      @start = 0
    else
      @start += 1
    end
    @actual_size -= 1
    return return_value

  end
end
