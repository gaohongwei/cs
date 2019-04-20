term: 
    var, opt, value, datatype
10  age,    <=,  30, int
20  gender, ==,  'M', string
30  age,    <=,  25, int
40  gender, ==,  'F', string
50  degree  ==   'MS'


rules
  # opr, 
   name       opr_on_child  parent_id 
10  male,     'and',
20  female,   'and'
30  top       'and'



rule_term
  rule_id term_id  rule_id
  10      10
  10      20  
  20      30  
  20      40  
  30               10
  30               20 
  30       50
