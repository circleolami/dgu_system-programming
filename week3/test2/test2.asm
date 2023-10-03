test2    start   1000                                            
first    lda     zero                                            
         ldx     zero                                            
cloop    ldch    animal,x                                        
         add     diff                                            
         stch    dest,x                                          
         tix     len                                             
         jlt     cloop                                           
         lda     zero                                            
diff     word    32                                              
zero     word    0                                               
len      word    7                                               
animal   byte    c'penguin'                                      
dest     resb    7                                               
         end     first                                           
three    word    3                                               
diff     word    25                                              
chara    byte    c'a'                                            
charz    byte    c'z'                                            
alpha    resw    1                                               
str      resb    3                                               
         end     first                                           
