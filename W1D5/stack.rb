class Stack
    def initialize
        @stack_data = [1,2,3,4]
    end

    def push(el)
     @stack_data << el if !@stack_data.include?(el)
    # raise "stacks can't have duplicate elements!" if @stack_data.include?(el)
    end

    def pop
        @stack_data.pop
    end

    def peek
        @stack_data.first
    end
end

class Queue
    def initialize
        @queue_var = [1,2,3,4]
    end

    def enqueue(el)
        @queue_var << el
    end

    def dequeue
        @queue_var.shift 
    end

    def peek
        @queue_var
    end
end


class Map
  def initialize
    @map_array = []
  end

  def set(key, value)
    pair_index = map_array.index { |pair| pair[0] == key }
    if pair_index
      map_array[pair_index][1] = value
    else
      map_array.push([key, value])
    end
    value
  end

  def get(key)
    map_array.each { |pair| return pair[1] if pair[0] == key }
    nil
  end

  def delete(key)
    value = get(key)
    map_array.reject! { |pair| pair[0] == key }
    value
  end

  def show
    deep_dup(map_array)
  end

  private

  attr_reader :map_array
  
  def deep_dup(arr)
    arr.map { |el| el.is_a?(Array) ? deep_dup(el) : el }
  end  
end
