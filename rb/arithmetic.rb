def prime?(n)
  for i in 2..(n/2)
    return false if n % i == 0
  end
  true
end

puts "prime(23) = #{prime?(23)}"
puts "prime(25) = #{prime?(25)}"

def gcd(m,n)
  return m if n == 0
  gcd(n, m % n)
end

puts "gcd(50,175) = #{gcd(50,175)}"

def coprime?(x,y)
  gcd(x,y) == 1
end

puts "coprime(25,75) = #{coprime?(25,75)}"
puts "coprime(35,64) = #{coprime?(35,64)}"

def phi(m)
  (1..m).inject(0) {|phi,x| phi+=1 if coprime?(x,m); phi} # (1..m) works for 1 but its redundant
end

puts "phi(1) = #{phi(1)}"
puts "phi(10) = #{phi(10)}"
puts "phi(21) = #{phi(21)}"

def prime_nums(range)
  range.select {|x| prime?(x)}
end

def product(ary)
  ary.inject(1) {|p,x| p *= x}
end

def prime_factors(n)
  primes = prime_nums(2..n)
  factors = []
  loop do
    primes.each do |prime|
      divisor = product(factors) * prime
      if(n % divisor == 0)
        #puts "adding factor",prime
        factors << prime
        return factors.sort if n == divisor
      end
    end
  end
end

puts "prime_factors(20) = #{prime_factors(20).join(',')}"
puts "prime_factors(315) = #{prime_factors(315).join(',')}"

def prime_multiplicities(n)
  pm = {}
  prime_factors(n).each {|prime| pm[prime] ||= 0; pm[prime] += 1}
  pm.sort
end

puts "prime_multiplicities(20) = "
p prime_multiplicities(20)
puts "prime_multiplicities(315) = "
p prime_multiplicities(315)

def phi2(n)
  prime_multiplicities(n).inject(1) do |phi, pm| 
    p = pm[0]
    m = pm[1]
    phi *= (p-1) * (p**(m-1))
  end
end

puts "phi2(10) = #{phi2(10)}"
puts "phi2(21) = #{phi2(21)}"

#puts "phi(10090) = #{phi(10090)}"
#puts "phi2(10090) = #{phi2(10090)}"

class Array
  def pairs
    pairs = []
    for x in 0...self.length
      for y in (x+1)...self.length
        pairs << [self[x],self[y]]
      end
    end
    pairs.sort.uniq
  end
  
  def sum
    inject{|sum,x| sum+=x}
  end
end

def goldbach(n)
  primes = prime_nums(1..(n-1))
  primes.pairs.select {|pair| pair.sum == n}.first
end

puts "goldbach(6) = #{goldbach(6).join(',')}"
puts "goldbach(28) = #{goldbach(28).join(',')}"
#puts "goldbach(1984) = #{goldbach(1984).join(',')}"

def goldbach_list(min,max)
  (min..max).each do |x|
    if x.even?
      puts "#{x} = #{goldbach(x).join(' + ')}"
    end
  end
end

goldbach_list(4,50)

#puts "Numbers with Goldbach primes greater than 50:"
#g50 = 0
#(4..1000).step(2) do |x|
#  gb = goldbach(x)
#  if gb[0] > 50 and gb[1] > 50
#    puts "x = #{gb.join(' + ')}"
#    g50 += 1
#  end
#end
#puts g50