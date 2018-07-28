1.1.1   28. Implement strStr()
Implement strStr().
Returns the index of the first occurrence of needle in haystack, or -1 if needle is not part of haystack.
# @param {String} haystack
# @param {String} needle
# @return {Integer}
def str_str(haystack, needle)
    len_needle = needle.length
    len_haystack = haystack.length
    return -1 if len_needle > len_haystack
    pos = 0
    (pos..(len_haystack-len_needle))
end
