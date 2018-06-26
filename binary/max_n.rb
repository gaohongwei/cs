class SortedArray
  # Ascending order
  attr_accessor :block, :sorted_array
  def initialize(&comparion_block)
    @block = comparion_block 
    @block ||= Proc.new { |x,y| x <=> y }
    @sorted_array = []
  end

  def sort(array)
    reset_sorted_array
    array.each{|item|add_item(item)}
    sorted_array
  end

  def max_n(array, max_len)
    reset_sorted_array
    array.each do |item|
      add_item(item)
      sorted_array.shift if sorted_array.length >  max_len
    end
    sorted_array
  end

  private
  def reset_sorted_array
    @sorted_array = []
  end
  def add_item(item)
    pos = find_index_of(item) 
    sorted_array.insert(pos, item)
  end  
  def find_index_of(item) 
begin
    return 0  if sorted_array.length < 1

    return 0  if block.call(sorted_array[0], item) >= 0
    return -1 if block.call(sorted_array[-1], item) <= 0
    # now we have at least two elements
    start=0
    stop = sorted_array.length - 1
    while( (stop - start) > 1) # 0, 1
      mid = (start + stop)/2 
      comparion_value = block.call(item, sorted_array[mid])   
      if comparion_value == 0
        return mid
      elsif comparion_value > 0
        start = mid
      else
        stop = mid
      end
    end
  rescue
    puts item
  end
    # stop - start = 1
    return stop
  end

end # class SortedArray

sorting = SortedArray.new
array = [1,5,3,2,7]
sorting.sort(array)
sorting.max_n(array,3)
