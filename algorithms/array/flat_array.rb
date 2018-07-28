def flatten_array(items)
  return [items] unless items.is_a?(Array)
  out = []
  items.each do |item|
    out += flatten_array(item)
  end
  out
end

# use loop
def flatten_array(items)
  out = []
  to_do = items.reverse
  puts 'array:',items.to_s
  while(true)
    break if to_do.length < 1
    item = to_do.pop
    if item.is_a?(Array)    
      to_do += item.reverse
      puts 'current item:',item.to_s
      puts 'todo:',to_do.to_s        
    else
      out << item
    end
  end
  out
end

  
ar = [[1,100],[2,[20,[200,[2000,2001]]]] , [3, [30,[300,[3000,[3001,3002]]]]]]
br =  flatten_array(ar)
