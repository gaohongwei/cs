#  input:
#   intervals: array of array
#      [[2,5], [1,3], [6,9]]
#  Output
#      [[1,5], [6,9]]
def merge_asc_sorted(intervals)
  merged = []
  intervals.each do |interval|
    if merged.empty? 
      merged << interval
    elsif merged.last.last < interval.first
      # no overlapping
      merged << interval      
    else # overlapping
      merged[-1][1] = interval.last if interval.last > merged.last.last
    end
  end

  return merged
end

def merge(intervals)
  sorted = intervals.sort_by { |interval| interval.first }
  merge_asc_sorted(sorted)
end

slots = [[1,3],[2,4], [6,7], [2,3], [9,12] ] 
pp merge(slots)
