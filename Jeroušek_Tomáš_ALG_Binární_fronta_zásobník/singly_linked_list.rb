require_relative "index_out_of_bounds_exception"
require_relative "wrong_list_exception"

class SinglyLinkedListItem
  attr_accessor :object, :next
  attr_reader :list
  def initialize(object, list)
    @object = object
    @list = list
  end
end

class SinglyLinkedList
  attr_reader :length

  # constructor
  def initialize
    @length = 0
    @head = nil
    @tail = nil
  end

  private

  # get_item(i)
  # returns the SinglyLinkedListItem at given index
  def get_item(index)
    active = @head
    index.times do
      active = active.next
    end
    return active
  end

  public

  # get(i)
  # returns the value (object) at given index
  def [](index)
    # raises IndexOutOfBoundsException if index is out of bounds [0, @length)
    active = @head
    index.times do
      active = active.next
    end
    return active.object
  end

  # set(i, value)
  # always returns value
  def []=(index, object)
    # raises IndexOutOfBoundsException if index is out of bounds [0, @length)
    active = @head
    index.times do
      active = active.next
      active.object = object
    end
    return object
  end

  # find(value)
  # returns the first list item with the @object equal to object, or nil if this value is not found
  def find(object)
    active = @head
    until active.nil?
      if active.object == object
        return active
      else
        active = active.next
      end
    end
    return nil
  end

  # iterate(callback)
  # as you have not covered yield in the Ruby course, this is already done
  def each
    if @length > 0
      item = @head
      begin
        yield item.object
        item = item.next
      end until item.nil?
    end
  end

  # insert_before(item, value)
  # returns the new list item
  def insert_before(item, object)
    # raises IndexOutOfBoundsException if index is out of bounds [0, @length)
    if item.list != self
      raise WrongListException.new(item, self)
    end
    return unshift(object) if @head == item
    cycler = @head.next
    anth_cycler = @head
    numerare = 1

    until cycler.nil?
      break if cycler == item
      anth_cycler = cycler
      cycler = anth_cycler.next
      numerare += 1
    end
    new = SinglyLinkedListItem.new(object, self)
    new.next = cycler
    anth_cycler = new
    @length += 1
    insert_after(anth_cycler, object)
    return new
  end

  # insert_after(item, value)
  # returns the new list item
  def insert_after(item, object)
    # raises IndexOutOfBoundsException if index is out of bounds [0, @length)
    if item.list != self
      raise WrongListException.new(item, self)
    end
    new_object = SinglyLinkedListItem.new(object, self)
    new_object.next = item.next
    item.next = new_object
    @length =+ 1
    return new_object
  end

  # insert(i, value)
  # always returns self
  def insert(index, object)
    # raises IndexOutOfBoundsException if index is out of bounds [0, @length)
    if (index < 0) || (index >= @length)
      raise IndexOutOfBoundsException.new(index, @length)
    end
    return unshift(object) if index == 0

    a = get_item(index - 1)
    b = SinglyLinkedListItem.new(object, self)
    c = a.next
    b.next = c.next
    a.next = b
    @length += 1
    return self
  end

  # remove_item(item)
  # returns a value of the removed item
  def remove_item(item)
    # raises WrongListException if item.list != self
    if item.list != self
      raise WrongListException.new(item, self)
    end

    return_value = item.object

    if item == @head
      if @head == @tail
        @tail = nil
      end
      @head = @head.next
    else
      cycler = @head.next
      anth_cycler = @head
      until cycler.nil?
        if cycler == item
          break
        end
        anth_cycler = cycler
        cycler = anth_cycler.next
      end
      if @tail == cycler
        @tail = anth_cycler
      end
      anth_cycler.next = cycler.next
    end
    @length -= 1
    return return_value
  end

  # remove(i)
  # returns the removed value
  def delete_at(index)
    # raises IndexOutOfBoundsException if index is out of bounds [0, @length)
    raise IndexOutOfBoundsException.new(index, @length) if index >= @length or index < 0
    point = @head
    index.times do
      point = point.next
    end
    return self.remove_item(point)
  end


  # append(value)
  # always returns self
  def <<(object)
    unless @head == nil
      @tail.next = SinglyLinkedListItem.new(object, self)
      @tail = @tail.next
    else
      @head = SinglyLinkedListItem.new(object, self)
      @tail = @head
    end
    @length += 1
    return self
  end

  # prepend(value)
  # always returns self
  def unshift(object)
    novice = SinglyLinkedListItem.new(object, self)
    if @head == nil
      @head = novice
      @tail = @head
    else
      novice.next = @head
      @head = novice
    end
    @length += 1
    self
  end

  # converts self to a standard Ruby Array (already done)
  def to_a
    result = []
    self.each do |item|
      result << item
    end
    return result
  end

end
