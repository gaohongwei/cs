1.1.17  58. Length of Last Word
Given a string s consists of upper/lower-case alphabets and empty space characters ' ', 
    return the length of last word in the string.

If the last word does not exist, return 0.

Note: A word is defined as a character sequence consists of non-space characters only.

For example, 
Given s = "Hello World",
return 5.

# @param {String} s
# @return {Integer}
def length_of_last_word(str)
  count = 0
  last_length = 0
  str.each_char do |ch|
    if ch.match(/[\s,;]/)     
      last_length = count if count > 0
      count =0 
    else
      count += 1
    end
  end
  last_length = count if count > 0
  last_length
end


strs = [
"3 This is abc", 
"3 This is    abcd", 
"3 This, is;;abc ", 
]


strs.map{|str| length_of_last_word(str) }
