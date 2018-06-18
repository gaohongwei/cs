def bsearch(ar, target, start=0, stop=nil) 
  stop ||= ar.length - 1
  middle = (start + stop)/2
  puts "#{start}:#{stop} middle=#{middle}"
  if (stop-start) < 2 # two elements
    return stop if ar[stop] == target
    return start if ar[start] == target    
    return -1
  end   


  if ar[middle]  ==  target
    return middle
  elsif ar[middle]  <  target
    return bsearch(ar, target, middle, stop)
  else
    return bsearch(ar, target, start, middle)
  end
end

def bsearch(ar, target)
  start = 0
  stop = ar.length - 1
  while( (stop - start) > 1)
    pivot = (start + stop)/2
    puts "start=#{start} stop=#{stop}, pivot = #{pivot}"    
    if ar[pivot] == target
      return pivot      
    elsif ar[pivot] > target  
      stop = pivot
    else
      start = pivot  
    end
  end
  return -1 
end

ar = (1..100).select{|x|x.even?}
bsearch(ar, 8)
bsearch(ar, 7) # will crash
