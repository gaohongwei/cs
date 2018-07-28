def sum_of_left_leaves(root)
  sum = 0
  return 0 if root.nil?

  if root.left
    if root.left.right.nil? && root.left.left.nil?
      sum += root.left.val 
    else 
      sum += sum_of_left_leaves(root.left)
    end
  end
  
  sum += sum_of_left_leaves(root.right)
  sum
end
