def average_of_levels(root)
  out = []
  return out if root.nil?
  queue = [ root ]
  new_queue = []
  values_by_level = []
  while(queue.length > 0 )
    values_by_level = []
    new_queue = []
    queue.each do |node|
      values_by_level << node.val 
      new_queue << node.left if node.left 
      new_queue << node.right if node.right       
    end
    sum = values_by_level.inject(0) {|sum, i|  sum + i }
    sum /= values_by_level.length.to_f
    out << sum
    queue = new_queue 
  end
  out
end
