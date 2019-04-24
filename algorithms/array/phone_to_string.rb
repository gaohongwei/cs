MAPPING = [
  '0',
  '1',
  ['A', 'B', 'C'],
  ['D', 'E', 'F'],
  %w(G H I)
]


def nums_to_str(nums)
  len = nums.length
  return if len < 1

  out_array = []
  (0..(len-1)).each do |index|
    num = nums[index].to_i
    chars = MAPPING[num]
    out_array = combine(out_array, chars)
  end
  out_array
end

def combine(ar_string, ar_ch)
  return ar_ch if ar_string.empty?  
  out = []
  ar_ch.each do |ch|
    out +=  ar_string.map{|str| "#{str}#{ch}"}
  end
  out
end

ar =  [1,2,3]
ar1d = ['A', 'B', 'C']
combine(ar, ar1d)

nums = '2'
puts nums_to_str(nums)

nums = '23'
puts nums_to_str(nums)

nums = '234'
puts nums_to_str(nums)
