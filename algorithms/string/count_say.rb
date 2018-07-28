# @param {Integer} n
# @return {String}
def count_say_one(s)
  len = s.length
  index = 0
  count = 0
  target = s[0]
  out = ''
  (0..(len-1)).each do |index|
    ch=s[index]
    if ch == target
      count +=1
    else
     out += "#{count}#{target}"
     target = s[index]
     count = 1
    end
  end
  out += "#{count}#{target}"
  out
end
def count_and_say(n)
  s='1'
  puts s
  return if n < 2
  (2..n).each do |index|
    s= count_say_one(s)
    puts s
  end
end
