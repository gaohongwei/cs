def qsort(ar,start=0, stop=nil)
  stop ||= ar.length-1
  if  (stop-start)<1
    return 
  end
  if  (stop-start)<2
    swap(ar,start,stop)
    return 
  end
  pivot=ar[stop]
  puts ar[start..stop].to_s  
  puts "pivot=#{pivot}"

  ileft=start
  iright=stop-1
  while(ileft<iright) 
    while(ar[ileft]<pivot) 
      ileft+=1
    end
    while(ar[iright]>=pivot) 
      iright-=1
    end
    puts "swap #{ileft},#{iright}"    
    swap(ar,ileft,iright)
    ileft+=1
    iright-=1

    puts ar[start..stop].to_s
  end
  swap(ar,ileft,stop)
  puts ar[start..ileft].to_s
  puts ar[(ileft+1)..stop].to_s  
  qsort(ar,start, ileft)
  qsort(ar,ileft+1, stop)
end

def swap(ar,pos1,pos2)
  tmp=ar[pos1]
  ar[pos1]=ar[pos2]
  ar[pos2]=tmp
end
