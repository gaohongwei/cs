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

def remove_dup(nums) # for sorted
  len = nums.length
  last = 0
  target = nil
  nums.each do |num|
    if num != target
      target = num
      nums[last] = num
      last +=1
    end
  end
  (last..(len-1)).each {|index| nums[index] = '*'}
end

remove_dup is very simialr to remove_target
The different is to assign a target
## test case
nums = (1..10).to_a.shuffle
target = 5
remove_target(nums,target)
nums

nums =  [1,1,2,2,3,4,4,5,6,6]
remove_dup(nums)
nums

def remove_target2(nums,target) # remove zero
  count =0
  len = nums.length
  nums.each_with_index do |num,index|
    if num == target
      count +=1
    else
      nums[index-count] = num
    end
  end
  last = len - count # len - 1 - count +1
  (last..(len-1)).each {|index| nums[index] = '0'}
end
