def leaf_similar(root1, root2)
    tree_leaf(root1) == tree_leaf(root2)
end

def tree_leaf(root)
  return [] if root.nil?
  stack = [root]
  out = []
  while(stack.length > 0)
    node = stack.pop
    if node.left.nil? && node.right.nil? 
      out << node.val
    else 
      stack << node.left  if node.left
      stack << node.right if node.right      
    end
  end
  out
end

def tree_leaf(root)
  return [] if root.nil?
  return [root.val] if root.left.nil? && root.right.nil?
  tree_leaf(root.left) + tree_leaf(root.right) 
end
