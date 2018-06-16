function split_str(str){
  var splitter = /[\s,;]/
  var start=-1, count=0
  var ch
  var words = []
  for(var index=0,len=str.length;index<len;index++){
    ch = str[index]
    if( splitter.test(ch)){
      if(count>0) words.push(str.substr(start+1,count))
      count =0
      start=index
    } else{
      count++  
    }
  }
  if(count>0)  words.push(str.substr(start+1,count))
  return words;
}

var str = 'abc  , mn kfg'
console.log(str)
console.log(split_str(str))
