require_relative "index_out_of_bounds_exception"
require_relative "boolean_expected_exception"

class BooleanArray
  attr_reader :length
  attr_reader :used_length

  # constructor (already done)
  def initialize(length)
    @length = length
    @used_length = 0
    @inner = Array.new(length, nil)

    # original 8-bit version
    # @inner = Array.new((length - 1) / 8 + 1, 0)
  end

  # original 8-bit version
  #
  # private
  #
  # # returns indices of the greater/outer byte and smaller/inner bit (already done)
  # def get_byte_bit(index)
  #   return [index / 8, index % 8]
  # end

  public

  # get(i)
  # returns bit (true/false value) at given index (already done)
  def [](index)
    raise IndexOutOfBoundsException.new(index, @length) if (index < 0 || index >= @used_length)
    return @inner[index] == true

    # original 8-bit version
    # byte, bit = get_byte_bit(index)
    # return ((@inner[byte]) & (1 << bit)) != 0
  end

  # set(i, value)
  # sets bit (true/false value) at given outer index (already done)
  # always returns value (already done)
  def []=(index, value)
    raise IndexOutOfBoundsException.new(index, @length) if (index < 0 || index >= @length)
    raise BooleanExpectedException.new(value) unless value.instance_of?(TrueClass) || value.instance_of?(FalseClass)
    @inner[index] = value
    @used_length = (index + 1)  if index >= @used_length
    return value

    # original 8-bit version
    # byte, bit = get_byte_bit(index)
    # if value
    #   @inner[byte] |= 1 << bit
    # else
    #   @inner[byte] &= 255 - (1 << bit)
    # end
    # @used_length = index + 1 if index >= @used_length
    # return value
  end

  # find(value)
  # returns (outer) index of the first found value, or nil when value is not found
  def find(value)
    numerare = 0
    self.each do |i|
      if i == value
        return numerare
      end
      numerare += 1
    end
    return nil
  end

  # iterate(callback)
  # as you have not covered 'yield' in the Ruby course, this is already done
  def each
    @used_length.times do |i|
      yield self[i]
    end
  end

  # insert(i, value)
  # always returns self
  def insert(index, value)
    # raises IndexOutOfBoundsException.new(index, @length) if the index is out of the correct bounds [0, @length), or if insert into the full array
    # raises BooleanExpectedException.new(value) if the value is not an instance of TrueClass or FalseClass
    if !(0..@length).cover?(index) || @used_length == length
      raise IndexOutOfBoundsException.new(index, @length)
    end
    if value != false && value != true
      raise BooleanExpectedException.new(value)
    end
    new = @used_length
    (new - index).times do |i|
      self[new - i] = self[new - i - 1]
    end
    self[index] = value
    return self
  end

  # remove(i)
  # returns the removed value
  def delete_at(index)
    # raises IndexOutOfBoundsException.new(index, @length) if the index is out of the correct bounds [0, @used_length)
    if !(0..@used_length).cover?(index)
      raise IndexOutOfBoundsException.new(index, @length)
    end
    value = self[index]
    (@used_length - index - 1).times do |i|
      self[index + i] = self[index + i + 1]
    end
    @used_length -= 1
    return value
  end

  # append(value)
  # always returns self
  def <<(value)
    # raises IndexOutOfBoundsException.new(index, @length) if the array is full
    # raises BooleanExpectedException.new(value) if the value is not an instance of TrueClass or FalseClass
    if @used_length == @length
      raise IndexOutOfBoundsException.new(@used_length, @length)
    end
    if value != false && value != true
      raise BooleanExpectedException.new(value)
    end
    self[@used_length] = value
    return self
  end

  # prepend(value)
  # always returns self
  def unshift(value)
    # raises IndexOutOfBoundsException.new(index, @length) if the array is full
    # raises BooleanExpectedException.new(value) if the value is not an instance of TrueClass or FalseClass
    insert(0, value)
    return self
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
