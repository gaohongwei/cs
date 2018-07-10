def flatten_ar(items)
  return [items] unless items.is_a?(Array)
  out = []
  items.each do |item|
    out += flatten_ar(item)
  end
  out
end

# use loop
def flatten_ar(items)
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
