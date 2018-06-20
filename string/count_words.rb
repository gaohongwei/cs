
1.1.12  434. Number of Segments in a String
Count the number of segments in a string, where a segment is defined to be a contiguous sequence of non-space characters.

Please note that the string does not contain any non-printable characters.

Example:

Input: "Hello, my name is John"
Output: 5

# @param {String} s
# @return {Integer}


def count_segments(str)
  words_count = 0
  count = 0
  str.each_char do |ch|
    if ch.match(/[\s,;]/)
      words_count += 1 if count > 0
      count =0 
    else
      count += 1
    end
  end
  words_count
end


strs = [
"3 This is abc", 
"3 This is    abc", 
"3 This, is;;abc", 
]


strs.map{|str| count_segments(str) }
