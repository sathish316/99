var EMPTY = [];

function head(list){
  return list[0];
}

function tail(list){
  return list.slice(1)
}

Array.prototype.eq = function(other){
  return this.length > 0 ? this == other :
         other.constructor == Array && other.length == 0 //Empty Arrays are not equal in js
}

//1
function last(list){
  if(tail(list).eq(EMPTY))
    return head(list);
  else
    return last(tail(list));
}

//2
function last_but_one(list){
  if(head(tail(list)) == last(list))
    return head(list);
  else
    return last_but_one(list.slice(1));
}

//3
function element_at(list,k){
  if(k == 1)
    return head(list)
  else
    return element_at(tail(list), k-1);
}

//4
function length(list){
  if(list.eq(EMPTY))
    return 0;
  else
    return 1 + length(tail(list));
}