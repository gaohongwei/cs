# bitmap or hash
def find_dup(nums)
  h={}
  nums.each_with_index do |num,index|
    return num if h[num]
    h[num] = index
  end
  return nil
end

def find_missed(nums, n)
  h={}
  (1..n).each {|x| h[x] = false}
  nums.each_with_index do |num,index|
    h[num] = index
    #h.delete(num)
  end
  h.select{|k,v| ! v }.keys
end
