def  merge_trees(t1, t2)
  return if t1.nil? && t2.nil?
  if t1.nil? && t2.nil?
    return t1 || t2
  else
    t = TreeNode.new(t1.val + t2.val)
    t.left =  merge_trees(t1.left, t2.left)
    t.right =  merge_trees(t1.right, t2.right)
  end
  t
end
