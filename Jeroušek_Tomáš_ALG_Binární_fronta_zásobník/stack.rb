require_relative "boolean_array"
require_relative "singly_linked_list"

class StackEmptyException < Exception
  def initialize(stack)
    @stack = stack
  end

  def message
    "Stack is empty"
  end
end

class StackFullException < Exception
  def initialize(stack)
    @stack = stack
  end

  def message
    "Stack is full"
  end
end

class SinglyListStack
  def initialize
    @stack = SinglyLinkedList.new
  end

  def push(x)
    # returns self
    @stack.unshift(x)
    return self
  end

  def pop
    # returns the removed value
    # raises StackEmptyException if stack is empty
    if @stack.empty?
      raise StackEmptyException.new(self)
    end
    return @stack.delete_at(0)

  end
end

class BooleanArrayStack
  def initialize(size)
    @stack = BooleanArray.new(size)
  end

  def push(x)
    # returns self
    # raises StackFullException if stack is already full
    if @stack.length == @stack.used_length
      raise StackFullException.new(self)
    end
    @stack << x
    return self
  end

  def pop
    # returns the removed value
    # raises StackEmptyException if stack is empty
    if @stack.used_length == 0
      raise StackEmptyException.new(self)
    end
    @stack.delete_at(@stack.used_length - 1)
  end
end
