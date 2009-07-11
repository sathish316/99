def last(list)
  list.last
end

def last_but_one
  list[-2]
end

def element_at(list, k)
  lisk[k-1]
end

def length(list)
  list.size
end

def reverse(list)
  list.each.inject([]){|all,x| all.insert(0,x)}
end

def palindrome?(list)
  list == list.reverse
end

#p palindrome?([1,2,3,2,1])
#p palindrome?([1,2,2,1])
#p palindrome?([1,2,3,4])

def flatten(list)
  list.inject([]) do |all,x|
    if x.is_a? Array
      flatten(x).each {|i| all << i}
    else
      all << x
    end
    all
  end
end

puts "flatten:"
p flatten([1,[2,[3,4],5]])

def compress(list)
  clist = []
  list.each {|x| clist << x if x != clist.last}
  clist
end

puts "compress:"
p compress([1,1,2,2,2,2,3,4,5,6,6,6,6,7,7,7])

def pack(list)
  plist = []
  list.each do |x|
    unless plist.last and plist.last.last == x
      plist  << []
    end
    plist.last << x
  end
  plist
end

puts "pack:"
p pack([1,1,2,2,2,2,3,4,5,6,6,6,6,7,7,7])

def rle(list)
  pack(list).collect {|l| [l.size, l.first]}
end

puts "rle:"
p rle([1,1,2,2,2,2,3,4,4,5,6,6,6,6,7,7,7])

def rlee(list)
  pack(list).collect do |l|
    l.size == 1? l.first : [l.size,l.first]
  end
end

puts "rlee"
p rlee([1,1,2,2,2,2,3,4,4,5,6,6,6,6,7,7,7])

def uncompress(rlee)
  rlee.inject([]) do |d,e|
    if e.is_a? Array
      e[0].times {d << e[1]}
    else
      d << e
    end
    d
  end
end

puts "uncompress:"
p uncompress([[2, 1], [4, 2], 3, [2, 4], 5, [4, 6], [3, 7]])

def rled(list)#TODO
  clist = []
  num = count = nil
  list.each do |x|
    last = clist.last
    unless (last and (last == x or last[1] == x))
      clist << x
    else
      last = clist.pop
      if last.is_a? Fixnum
        clist << [2,x]
      else
        clist << [last[0]+1,x]
      end
    end
  end
  clist
end

puts "rled:"
p rled([1,1,2,2,2,2,3,4,4,5,6,6,6,6,7,7,7])

def dup(list)
  list.inject([]){|result,x| result << x; result << x}
end

puts "dup:"
p dup([1,2,3,4,5])

def dupn(list,n)
  list.inject([]){|result,x| n.times {result << x}; result}
end

puts "dupn:"
p dupn([1,2,3,4,5],4)

class Array
  def select_with_index(&block)
    sel_array = []
    each_with_index do |x,i|
      sel_array << x if yield(x,i)
    end
    sel_array
  end
  def reject_with_index(&block)
    sel_array = []
    each_with_index do |x,i|
      sel_array << x unless yield(x,i)
    end
    sel_array
  end
end

def drop(list,n)
  list.reject_with_index {|x,index| (index+1) % n == 0}
end

puts "drop:"
p drop(['a','b','c','d','e','f','g','h','i'],3)

def split(list, n)
  first = []
  n.times {first << list.shift}
  [first, list]
end

puts "split:"
p split( %w{a b c d e f g h i},3)

def slice(list,i,j)
  list.select_with_index {|x,index| index >= i-1 and index <= j-1}
end

puts "slice:"
p slice(%w{a b c d e f g h i j k},3,7)

def rotate(list,n)
  n.times {list << list.shift}
  list
end

puts "rotate:"
p rotate(%w{a b c d e f g h},3)

def remove_at(list,k)
  list.reject_with_index {|x,i| i == (k-1)}
end
  
puts "remove:"  
p remove_at(%w{a b c d},2)