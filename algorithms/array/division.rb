def division(n,d)
    ratios = []
    lefts = []
    ratio = 0
    left = 0

    ratio = n/d
    n = n % d

    ratios << ratio
    ratios << '.'

    while(true)
        puts "loop: #{n},#{d},#{left}"
        puts "lefts: #{lefts.join(',')}", 
        ratio = (10*n)/d 
        left = (10*n)%d 

        ratios << ratio      
        break  if left == 0           
        break  if lefts.include?(left)

        lefts << left         
        n = left        
    end

    ratios
end

n = 11
d= 5
ratios = division(n,d)
puts 'ratios',ratios.join('')
