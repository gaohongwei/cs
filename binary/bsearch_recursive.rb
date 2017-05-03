def bsearch(ar, target, start=0, stop=ar.length)
  middle = (start + stop)/2
  puts "#{start}:#{stop} middle=#{middle}"
  if ar[middle]  ==  target
    return middle
  elsif ar[middle]  <  target
    bsearch(ar, target, middle, stop)
  else
    bsearch(ar, target, start, middle)
  end
end

ar = (1..100).select{|x|x.even?}
bsearch(ar, 8)
bsearch(ar, 7) # will crash
