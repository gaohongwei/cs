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

def bsearch(ar, target, start=0, stop=nil) 
  stop ||= ar.length - 1

  while((stop - start) > 1) 
    mid = (start + stop)/2    
    if ar[mid]  ==  target
      return mid
    elsif ar[mid]  <  target
      start = mid
    else
      stop = mid
    end
  end
  # stop - start = 1
  return stop if ar[stop] == target
  return start if ar[start] == target  
  return -1
end

ar = (1..100).select{|x|x.even?}
bsearch(ar, 8)
bsearch(ar, 7) # will crash
