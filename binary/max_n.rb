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

  def find_index_of(item) 
    # No data or out of bundry
    return -1  if sorted_array.length < 1 || compare(sorted_array[0], item) > 0 || compare(sorted_array[-1], item) < 0
    # now we have at least one element
    start=0
    stop = sorted_array.length - 1
    while( (stop - start) > 1) # 0, 1
      mid = (start + stop)/2 
      comparion_value = compare(item, sorted_array[mid])   
      if comparion_value == 0
        return mid
      elsif comparion_value > 0
        start = mid
      else
        stop = mid
      end
    end
    # stop - start == 1
    return start if compare(item, sorted_array[start])  == 0
    return stop if compare(item, sorted_array[stop])  == 0
    return -1
  end

  def find_index_for(item) 
    return -1 if sorted_array.length < 1
    return 0  if compare(sorted_array[0], item) >= 0
    return -1 if compare(sorted_array[-1], item) <= 0
    # now we have at least one element
    start=0
    stop = sorted_array.length - 1
    while( (stop - start) > 1) # 0, 1
      mid = (start + stop)/2 
      comparion_value = compare(item, sorted_array[mid])   
      if comparion_value == 0
        return mid
      elsif comparion_value > 0
        start = mid
      else
        stop = mid
      end
    end
    # stop - start = 1
    return stop
  end

  private

  def compare(x,y)
    block.call(x,y)
  end

  def reset_sorted_array
    @sorted_array = []
  end
  def add_item(item)
    pos = find_index_for(item) 
    sorted_array.insert(pos, item)
  end  
end # class SortedArray

sorting = SortedArray.new
array = (1..20).to_a.shuffle.select{|x| x%2 == 0}
sorting.sort(array)
sorting.find_index_of(3)
sorting.find_index_for(3)
