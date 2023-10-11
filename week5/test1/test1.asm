test3    start   1000                                            
first    stl     retadr                                          
         jsub    sum                                             
         lda     total                                           
         j       last                                            
retadr   resw    1                                               
sum      lda     zero                                            
         sta     total                                           
         sta     index                                           
loop     ldx     index                                           
         lda     total                                           
         add     table,x                                         
         sta     total                                           
         lda     index                                           
         add     three                                           
         sta     index                                           
         comp    count                                           
         jlt     loop                                            
         rsub                                                    
table    word    2                                               
         word    9                                               
         word    18                                              
         word    22                                              
         word    6                                               
count    word    15                                              
total    resw    1                                               
index    resw    1                                               
max      resw    1                                               
zero     word    0                                               
three    word    3                                               
last     end     first                                           
