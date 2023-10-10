test2    start   1000                                            
first    lda     zero                                            
         ldx     zero                                            
copy     ldch    str1,x                                          
         comp    dot                                             
         jeq     replace                                         
put      stch    str2,x                                          
         tix     maxlen                                          
         jlt     copy                                            
         lda     zero                                            
replace  ldch    str2                                            
         j       put                                             
zero     word    0                                               
maxlen   word    12                                              
str1     byte    c'cute.penguin'                                 
str2     byte    c'-'                                            
str3     resb    12                                              
dot      word    46                                              
         end     first                                           
