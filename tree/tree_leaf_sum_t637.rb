def average_of_levels(root)
  out = []
  return out if root.nil?
  todo = [ root ]
  new_todo = []
  values_by_level = []
  while(todo.length > 0 )
    values_by_level = []
    new_todo = []
    todo.each do |node|
      values_by_level << node.val 
      new_todo << node.left if node.left 
      new_todo << node.right if node.right       
    end
    sum = values_by_level.inject(0) {|sum, i|  sum + i }
    sum /= values_by_level.length.to_f
    out << sum
    todo = new_todo 
  end
  out
end
