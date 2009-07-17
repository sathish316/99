var first = function(ary){
  return ary[0];
}

var rest = function(ary){
  return ary.slice(1);
}

var p99 = {
last: function(ary){
  return ary[ary.length-1];
},

last_but_one: function(ary){
  return ary[ary.length-2];
},

kth: function(ary,k){
  return ary[k-1];
},

len: function(ary){
  return ary.length;
},

reverse: function(ary){
  if(ary.length <= 1)
    return ary;
  return this.reverse(rest(ary)).concat([first(ary)]);
}

};
