https://gist.github.com/aspyct/3433278
# Use additional space
def msort(ar,start=0,stop=nil)
  stop||=ar.length-1
  return if (stop-start)<1
  pivot = (start + stop)/2

  puts ar[start..stop].to_s
  msort(ar,start,pivot)
  msort(ar,pivot+1,stop)
  merge(ar,start,pivot,stop)
end

def merge(ar,start,pivot,stop)
  i=start
  j=pivot+1
  out=[]
  puts "Before merge"
  # puts "i=#{i},j=#{j} start=#{start} pivot=#{pivot} stop=#{stop}"
  puts ar[start..pivot].to_s
  puts ar[(pivot+1)..stop].to_s
  while(i<=pivot&&j<=stop)
    if ar[i] < ar[j]
      out << ar[i]
      i+=1
    else
      out << ar[j]
      j+=1
    end
  end
  while(i<=pivot)
    out << ar[i]
    i+=1
  end
  while(j<=stop)
    out << ar[j]
    j+=1
  end
  puts "After merge"
  # puts "i=#{i},j=#{j}"
  puts out.to_s
  #ar[start,(stop-start+1)] = out
  ar[start..stop] = out  
end

ar=(1..10).to_a.shuffle
msort(ar)
