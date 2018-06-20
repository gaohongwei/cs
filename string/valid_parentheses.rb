1.1.9   20. Valid Parentheses
Given a string containing just the characters '(', ')', '{', '}', '[' and ']', determine if the input string is valid.

The brackets must close in the correct order, "()" and "()[]{}" are all valid but "()" and "([])" are not.
# @param {String} s
# @return {Boolean}
def is_valid(s)
    ar=[]
    len=s.length
    index = 0
    while(index<len)
        ch= s[index]
        case ch
            when '(','[','{'
                ar.push(ch)
            when ')'
               return false if ar.pop != '('
            when ']'
               return false if ar.pop != '['            
            when '}'
               return false if ar.pop != '{'  
        end
        index +=1
    end
    ar.empty?
end
