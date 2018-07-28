https://leetcode.com/problems/convert-sorted-array-to-binary-search-tree/description/
def sorted_array_to_bst(nums)
    return nil if nums.length < 1
    tree_helper(nums, 0, nums.length - 1)
end

def tree_helper(nums, from, to)
  return if from > to
  mid = ( from + to)/2
  root = TreeNode.new(nums[mid])
  root.left = tree_helper(nums, from, mid - 1)
  root.right = tree_helper(nums, mid + 1, to)  
  root
end
