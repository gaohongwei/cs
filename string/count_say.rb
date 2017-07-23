def count_say(s)
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

def count_say_loop(n)
  s='1'
  puts s
  (1..n).each do |index|
    s= count_say(s)
    puts s
  end
end
count_say_loop(5)
