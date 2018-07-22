https://leetcode.com/problems/binary-tree-inorder-traversal/description/
def inorder_traversal_v1(root)
  out = []
  return out unless root
  out += inorder_traversal(root.left) if root.left
  out << root.val
  out += inorder_traversal(root.right) if root.right
  out
end

def inorder_traversal(root)
  out = []
  return out if root.nil?  
  todos = []
  node = root 
  while( node || todos.length > 0 )
    if node
      todos << node
      node = node.left
    else
      node = todos.pop
      out << node.val 
      node = node.right
  end
  out
end
