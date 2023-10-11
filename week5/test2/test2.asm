test     start   1000                                            
first    stl     retadr                                          
         jsub    init                                            
retadr   resw    1                                               
init     lda     zero                                            
         sta     index                                           
         sta     max                                             
loop     ldx     index                                           
         lda     table,x                                         
         comp    max                                             
         jlt     skip                                            
         jeq     skip                                            
         sta     max                                             
skip     lda     index                                           
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
