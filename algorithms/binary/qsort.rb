# if pivot has the largest one or smallest one
# it will have o(n*n)
# have to exclude the pivot to avoid the endless loop
def qsort(ar,start=0, stop=nil)
  stop ||= ar.length-1
  if  (stop-start)<1
    return
  end
  # if  (stop-start)<2
  #   ar[start]:ar[stop]=ar[stop]:ar[start] if ar[stop]<ar[start]
  #   return
  # end
  pivot = partition(ar,start,stop)
  qsort(ar,start, pivot) if pivot > (start+1)
  qsort(ar,pivot+1, stop) if pivot < stop
end
def partition(ar,start,stop)
  pmid = (start+stop)/2
  pivot=ar[pmid ]
  puts ar[start..stop].to_s
  puts "pmid=#{pmid },pivot=#{pivot}"
  ileft=start
  iright=stop
  while(ileft<iright)
    # puts "ileft=#{ileft },iright=#{iright}"
    while ar[ileft] < pivot
      puts "shift ileft=#{ileft },iright=#{iright}"
      break if ileft>=iright
      ileft +=1
    end
    while ar[iright] >= pivot
      puts "ileft=#{ileft }, shift iright=#{iright}"
      break if ileft>=iright
      iright -=1
    end
    if ileft<iright
      puts ar[start..stop].to_s
      puts "swap #{ileft }, #{iright}"
      ar[ileft], ar[iright]= ar[iright], ar[ileft]
      ileft+=1
      iright-=1
    end
  end
  pivot = ileft
  puts "pivot=#{pivot}"
  puts ar[start..stop].to_s
  pivot
end

ar=(0..9).to_a.shuffle;qsort(ar)
