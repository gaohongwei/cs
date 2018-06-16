
function splitter(str){
  var splitter = /[\s,;]/;
  var index, len=str.length
  var count = 0
  var ch 
  var words =[]
  for(index=0;index<len;index++){
    ch = str[index]
    if(splitter.test(ch)){
      if(count > 0)words.push(str.substr(index-count, count))
      count = 0
    } else {
      count++
    }
  }
  if(count > 0)words.push(str.substr(index-count, count))
  return words
}

var str = ' abc a1  , a3 a3 a4  '

console.log(str)
var words = splitter(str)
console.log(words)
// index =5, last =4, count = 2, ,3,4
