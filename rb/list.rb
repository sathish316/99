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

#p flatten([1,[2,[3,4],5]])

def compress(list)
  clist = []
  list.each {|x| clist << x if x != clist.last}
  clist
end

#p compress([1,1,2,2,2,2,3,4,5,6,6,6,6,7,7,7])

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

#p pack([1,1,2,2,2,2,3,4,5,6,6,6,6,7,7,7])

def rle(list)
  pack(list).collect {|l| [l.size, l.first]}
end

p rle([1,1,2,2,2,2,3,4,4,5,6,6,6,6,7,7,7])

def rlee(list)
  pack(list).collect do |l|
    l.size == 1? l.first : [l.size,l.first]
  end
end

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

p uncompress([[2, 1], [4, 2], 3, [2, 4], 5, [4, 6], [3, 7]])