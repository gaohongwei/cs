def remove_target(nums,target) # remove zero
  len = nums.length
  last = 0
  nums.each do |num|
    if num != target
      nums[last] = num
      last +=1
    end
  end
  (last..(len-1)).each {|index| nums[index] = '*'}
end

nums = (1..10).to_a.shuffle
target = 5
remove_target(nums,target)
nums
