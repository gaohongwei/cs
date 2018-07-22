# t100 https://leetcode.com/problems/same-tree/description/
def is_same_tree(p, q)
  return true  if p.nil? && q.nil?
  return false if p.nil? || q.nil?  
  return false unless 
  is_same_tree(p.left, q.left) && is_same_tree(p.right, q.right)
end
def is_same_tree(p, q)
  return true  if p.nil? && q.nil?
  return false if p.nil? || q.nil?  
  return false unless p.val == q.val
  nodes_p = [p]
  nodes_q = [q]
  while( nodes_p.length > 0 && nodes_q.length > 0 )
    node_p = nodes_p.pop
    node_q = nodes_q.pop
    return false unless node_p.val == node_q.val
    nodes_p << node_p.left if node_p.left
    nodes_q << node_q.left if node_q.left   
    return false unless nodes_p.length == nodes_q.length
    nodes_p << node_p.right if node_p.right
    nodes_q << node_q.right if node_q.right   
    return false unless nodes_p.length == nodes_q.length    
  end
  true
end
