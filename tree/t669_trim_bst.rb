def trim_bst(root, l, r)
  return if root.nil?
  val = root.val  
  return trim_bst(root.left, l, r)  if val > r
  return trim_bst(root.right, l, r) if val < l

  root.left =  trim_bst(root.left, l, r)    
  root.right = trim_bst(root.right, l, r)

  root
end
