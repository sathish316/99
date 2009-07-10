//1
function last(list){
  if(list.length == 0)
    return null;
  else if(list.length == 1)
    return list[0]
  else
    return last(list.slice(1))
}

//2
function last_but_one(list){
  if(list.length < 2)
    return null;
  else if(list.length == 2)
    return list[0]
  else
    return last_but_one(list.slice(1))
}