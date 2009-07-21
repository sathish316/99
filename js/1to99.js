var first = function(ary){
  return ary[0];
}

var rest = function(ary){
  return ary.slice(1);
}

Array.prototype.eq = function(other){
  if(this.length != other.length)
    return false;
  for(var i=0; i< this.length; i++){
    if(this[i] !== other[i]){
      return false;
    }
  }
  return true;
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
},

palindrome: function(ary){
  return ary.eq(reverse(ary));
},

flatten: function(ary){
  var fary = [];
  for(var i=0;i<ary.length;i++){
    if((ary[i]).constructor == Array){
      fary = fary.concat(flatten(ary[i]));
    } else {
      fary.push(ary[i]);
    }
  }
  return fary;
},

compress: function(ary,e){
  if(ary.length == 0){
    return ary;
  }
  if(first(ary) == first(rest(ary))){
    return compress(rest(ary));
  } else {
    return [first(ary)].concat(compress(rest(ary)));
  }
}




};
